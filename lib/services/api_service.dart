import 'dart:convert';

import 'package:http_getx/models/post_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<PostModel>> fetchPosts() async {
    final allposts = Uri.parse(baseUrl);
    final response = await http.get(allposts);
    List<PostModel> posts = [];

    if (response.statusCode == 200) {
      List body = json.decode(response.body);

      for (var post in body) {
        posts.add(PostModel.fromJson(post));
      }
      return posts;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
