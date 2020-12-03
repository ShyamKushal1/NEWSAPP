import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../news.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr('news'))),
      body: BlocProvider(
        create: (_) => NewsBloc( RepositoryProvider.of<NewsRepository>(context))..add(NewsFetched()),
        child: _NewsList(),
      ),
    );
  }
}

class _NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<_NewsList> {
  final _scrollController = ScrollController();
  final _editingController = TextEditingController();
  NewsBloc _newsBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _newsBloc = context.read<NewsBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsBloc, NewsState>(
      listener: (context, state) {
        if (!state.hasReachedMax && _isBottom) {
          _newsBloc.add(NewsFetched());
        }
      },
      builder: (context, state) {
        switch (state.status) {
          case NewsStatus.failure:
            return Center(child: Text(tr('fail_msg')));
          case NewsStatus.success:
            if (state.news.isEmpty) {
              return Center(child: Text(tr('no_news')));
            }
            return Container(
              child: Column(
                children: [
                  Padding(padding: Common.getPadding(all: true, allValue: Dimens.PADDING_MEDIUM),
                    child: TextField(
                      onChanged: (value) {
                        _newsBloc.add(SearchNews(_editingController.text.toString()));
                      },
                      controller: _editingController,
                      decoration: InputDecoration(
                          labelText: tr('search'),
                          hintText: tr('search'),
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Visibility(visible: true,
                              child: IconButton(icon: Icon(Icons.close), onPressed: (){
                                _editingController.clear();
                                _newsBloc.add(ClearQuery(false));
                              })),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(Dimens.PADDING_MEDIUM)))),
                    ),
                  ),
                  Expanded(child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(color: Common.getColorFromHex(ColorValue.Divider_Color),);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsDetail(newsModel: state.news[index]),
                              ),
                            );
                          },
                          child: index >= state.news.length
                              ? BottomLoader()
                              : NewsListItem(newsModel: state.news[index])
                      );
                    },
                    itemCount: state.hasReachedMax
                        ? state.news.length
                        : state.news.length + 1,
                    controller: _scrollController,
                  ),)
                ],
              ),
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) _newsBloc.add(NewsFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

