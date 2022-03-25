import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider_assignment/model/post.dart';
import 'package:provider_assignment/service/post_service.dart';

class PostListViewModel with ChangeNotifier {
  PostService postService;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  PostListViewModel(this.postService);

  List<Post> postList = [];

  setPostList(List<Post> postList) {
    this.postList = postList;
    notifyListeners();
  }

  Future getPostList() {
    _isLoading = true;
    return postService.fetchAllPosts().then((value) {
      _isLoading = false;
      setPostList(value);
    }).onError((error, stackTrace) {
      _isLoading = true;
      print("Error while fetching the post list data: ${error.toString()}");
    });
  }
}
