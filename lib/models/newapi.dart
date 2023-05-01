import 'dart:convert';
import 'package:flutterproj/models/news.dart';
import 'package:http/http.dart' as http;

Future<List<Article>> fetchArticles() async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=bc9ac5425118457b93999af9b15d4858'));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    final articles = json['articles'] as List<dynamic>;
    return articles.map((article) => Article.fromJson(article)).toList();
  } else {
    throw Exception('Failed to load articles');
  }
}
