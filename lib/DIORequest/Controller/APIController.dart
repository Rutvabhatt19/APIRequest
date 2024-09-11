import 'dart:convert';

import 'package:api_request/DIORequest/Model/APIModel.dart';
import 'package:dio/dio.dart';

class APIHelper {
  APIHelper._();
  static final APIHelper apiHelper_http = APIHelper._();

  Future<List<News>?> featchAllNews() async {
    Response response = await Dio().get(
        "https://newsapi.org/v2/top-headlines/sources?apikey=7cc19f66029e48fabeef69827c131cd1");

    if (response.statusCode == 200) {
     final data=response.data;
      final List<dynamic> sourcesList = data['sources'];

      List<News> news = sourcesList.map((e) => News.fromJson(data: e)).toList();
      return news;
    } else {
      print('Failed to load news');
      return null;
    }
  }

  Future<List<News>?> fetchNewsByCategory(String category) async {
    final response = await Dio().get(
        "https://newsapi.org/v2/top-headlines?category=$category&apikey=ab6919d2c1a5491384b670853ac27e2c");

    if (response.statusCode == 200) {
      final data=response.data;
      List<dynamic> articles = data['articles'];
      return articles.map((json) => News.fromJson(data: json)).toList();
    } else {
      throw Exception("Failed to load news");
    }
  }
}
