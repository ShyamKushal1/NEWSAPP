import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class NewsRepository{

  /*This method connect with the api and fetches record */
  Future<List<NewsModel>> getNews(int startIndex, int limit) async {
    final response = await http.get(
      tr('api_url')+'&_start=$startIndex&_limit=$limit'
      //'http://newsapi.org/v2/everything?q=bitcoin&from=2020-11-01&sortBy=publishedAt&apiKey=090e6f303a4f4acc9be12e385e948152&_start=$startIndex&_limit=$limit',
    );
    if (response.statusCode == 200) {

      final data = json.decode(response.body)[tr('articles')] as List;
      List<NewsModel> dataList = data.map<NewsModel>((json) => NewsModel.fromJson(json)).toList();

      dataList.sort((a, b) {
        return a.sourceModel.name.toLowerCase().compareTo(b.sourceModel.name.toLowerCase());
      });

      return dataList;
    }
    throw Exception(tr('error_msg'));
  }

}