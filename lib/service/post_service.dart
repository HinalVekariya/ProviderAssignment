import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:provider_assignment/model/post.dart';

class PostService {
  final Dio _client;

  PostService(this._client);

  Future<List<Post>> fetchAllPosts() async {
    try {
      final response = await _client.get('/posts');
      return (response.data as List).map((x) => Post.fromJson(x)).toList();
    } on DioError catch (ex) {
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw Exception(errorMessage);
    }
  }

  Future<Post> fetchPostDetails(int id) async {
    try {
      final response = await _client.request(
        "/posts",
        options: Options(method: 'GET'),
        queryParameters: {'id': id},
      );
      return Post.fromJson(response.data[0]);
    } on DioError catch (ex) {
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw Exception(errorMessage);
    }
  }
}
