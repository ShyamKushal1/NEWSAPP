import 'package:flutter/material.dart';

import '../news.dart';

class NewsListItem extends StatelessWidget {
  const NewsListItem({Key key, @required this.newsModel}) : super(key: key);

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(width: Dimens.IMAGE_SIZE_SMALL, child: newsModel.urlToImage != null ? Image.network(newsModel.urlToImage) : Image.asset('assets/images/image_place_holder.jpg')),
      title: Text(newsModel.title, style: AppTextTheme.title(context),),
      isThreeLine: true,
      subtitle: Row(
        children: [
          Icon(Icons.alternate_email, color: Colors.black38,),
          Text(newsModel.sourceModel.name),
        ],
      ),
    );
  }
}
