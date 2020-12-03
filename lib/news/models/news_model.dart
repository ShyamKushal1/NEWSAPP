import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

class NewsModel extends Equatable {

  final String author;
  final String title;
  final String description;
  final String urlToImage;
  final String url;
  final String publishedAt;
  final String content;
  final SourceModel sourceModel ;

  const NewsModel({this.author, this.title, this.description, this.urlToImage, this.url,
    this.publishedAt, this.content, this.sourceModel});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        author: json [tr('author')],
        title: json [tr('title')],
        description :json [tr('description')],
        urlToImage:json [tr('urlToImage')],
        url:json [tr('url')],
        publishedAt:json [tr('publishedAt')],
        content:json [tr('content')],
        sourceModel: SourceModel.fromJson(json [tr('source')])
    );
  }

  @override
  List<Object> get props => [author, title, description, urlToImage, url, publishedAt, content, sourceModel];
}

class SourceModel{
  final String id;
  final String name;

  SourceModel({this.id, this.name});

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json[tr('id')],
      name: json[tr('name')],
    );
  }

  @override
  List<Object> get props => [id, name];
}

