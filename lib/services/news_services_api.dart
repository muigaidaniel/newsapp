import 'package:dio/dio.dart';
import 'package:newsapp/models/response.dart';

class NewsServicesApi {
  final String apiKey = 'a83891bb3e544e9db5e610711c8917dd';
  String crypto =
      'https://newsapi.org/v2/everything?q=crypto&language=en&from=2022-07-30&domains=coindesk.com&sortBy=publishedAt&apiKey=a83891bb3e544e9db5e610711c8917dd';
  String sports =
      'https://newsapi.org/v2/everything?q=sports&language=en&from=2022-07-30&domains=bleacherreport.com&sortBy=publishedAt&apiKey=a83891bb3e544e9db5e610711c8917dd';
  String tech =
      'https://newsapi.org/v2/everything?q=tech&language=en&from=2022-07-30&domains=techcrunch.com&sortBy=publishedAt&apiKey=a83891bb3e544e9db5e610711c8917dd';
  final Dio _dio = Dio();

  Future<List<Article>> getCryptoNews() async {
    final response = await _dio.get(crypto);
    News news = News.fromJson(response.data);
    return news.articles.take(20).toList();
  }

  Future<List<Article>> getTechNews() async {
    final response = await _dio.get(tech);
    News news = News.fromJson(response.data);
    return news.articles.take(20).toList();
  }

  Future<List<Article>> getSportsNews() async {
    final response = await _dio.get(sports);
    News news = News.fromJson(response.data);
    return news.articles.take(20).toList();
  }
}
