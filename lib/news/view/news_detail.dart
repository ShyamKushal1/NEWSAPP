import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../news.dart';

class NewsDetail extends StatelessWidget {

final NewsModel newsModel;

  const NewsDetail({Key key, this.newsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('detail')),
      ),
      body: _body(context),
    );
  }
  
 Widget _body(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            padding: Common.getPadding(same: true, sameValue: Dimens.PADDING_MEDIUM),
            child: newsModel.urlToImage != null ? Image.network(newsModel.urlToImage,) : Container(
              height: Dimens.IMAGE_SIZE_MEDIUM, child: Column(
              children: [
                Icon(Icons.not_interested, semanticLabel: 'No Image', color: Common.getColorFromHex(ColorValue.DATA_MISS_COLOR),),
                SizedBox(height: 10,),
                Text('no image', style: TextStyle(color: Common.getColorFromHex(ColorValue.DATA_MISS_COLOR)),)
              ],
            )),
          ),
          Container(
            padding: Common.getPadding(same: true, sameValue: Dimens.PADDING_MEDIUM),
            alignment: Alignment.centerLeft,
            child: Text(newsModel.title ?? tr('no_data'), style: AppTextTheme.label(context),),
          ),
          Container(
            padding: Common.getPadding(same: true, sameValue: Dimens.PADDING_MEDIUM),
            alignment: Alignment.centerLeft,
            child: Text(newsModel.description ?? tr('no_data'), style: AppTextTheme.medium(context),),
          ),
          Container(
            padding: Common.getPadding(same: true, sameValue: Dimens.PADDING_MEDIUM),
            alignment: Alignment.centerLeft,
            child: Text(newsModel.content ?? tr('no_data'), style: AppTextTheme.medium(context),),
          ),
          Container(
            padding: Common.getPadding(same: true, sameValue: Dimens.PADDING_MEDIUM),
            alignment: Alignment.centerLeft,
            child: Text('News Published by ~ ${newsModel.sourceModel.name}' ?? tr('no_data'), style: AppTextTheme.subtitle(context),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: Common.getPadding(same: true, sameValue: Dimens.PADDING_MEDIUM),
                child: Text(newsModel.publishedAt ?? tr('no_data'), style: AppTextTheme.small(context),),
              ),
              Container(
                padding: Common.getPadding(same: true, sameValue: Dimens.PADDING_MEDIUM),
                child: Text('~ ${newsModel.author}' ?? tr('no_data'), style: AppTextTheme.small(context),),
              ),
            ],
          ),
          FlatButton(
            padding: Common.getPadding(same: true, sameValue: Dimens.PADDING_MEDIUM),
            child: Text('${newsModel.url}' ?? tr('no_data'), style: AppTextTheme.url(context),),
            onPressed: (){
              if(newsModel.url != null)
                _launchURL(newsModel.url);
              },
          ),

        ],
      ),
    );
 }

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw tr('launch_err_msg');
  }
}

}
