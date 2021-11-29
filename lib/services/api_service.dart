import 'dart:convert';
import 'package:http/http.dart';
import 'package:newsapp/model/article_model.dart';

class ApiService {
  // put your api here
  final endPointUrl =
      "https://newsapi.org/v2/everything?q=apple&from=2021-11-28&to=2021-11-28&sortBy=popularity&apiKey=5042e814992a46ca9ffc4aebf57c9f87";

  Future<List<Article>> getArticle() async {
    List<Article> articles;
    var url = Uri.parse(endPointUrl);
    Response res = await get(url);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      articles = body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      return articles = [];
    }
  }
}
