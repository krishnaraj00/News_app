import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/model_class.dart';

class ApiService {
  final String apiKey = "d19c6a642fc9407c9b5b713a04829fe2";
  final String baseUrl = "https://newsapi.org/v2";

  /// Fetch Top Headlines by Category
  Future<List<Article>> fetchArticles(String category) async {
    final url = Uri.parse(
      "$baseUrl/top-headlines?country=us&category=$category&apiKey=$apiKey",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == "ok") {
        final List articles = data['articles'];
        return articles.map((json) => Article.fromJson(json)).toList();
      } else {
        throw Exception("API error: ${data['message']}");
      }
    } else {
      throw Exception("Failed to load articles: ${response.body}");
    }
  }

  /// Search Articles
  Future<List<Article>> searchArticles(String query) async {
    final url = Uri.parse(
      "$baseUrl/everything?q=$query&sortBy=publishedAt&apiKey=$apiKey",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == "ok") {
        final List articles = data['articles'];
        return articles.map((json) => Article.fromJson(json)).toList();
      } else {
        throw Exception("API error: ${data['message']}");
      }
    } else {
      throw Exception("Failed to search articles: ${response.body}");
    }
  }
}
