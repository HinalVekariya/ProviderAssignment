import 'package:flutter/cupertino.dart';
import 'package:provider_assignment/model/post.dart';
import 'package:provider_assignment/service/post_service.dart';

class PostDetailViewModel with ChangeNotifier {
  PostService postService;
  late Post post;
  bool _isLoading = false;

  PostDetailViewModel(this.postService);

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  setPost(Post post) {
    this.post = post;
    notifyListeners();
  }

  Future getPostDetail(int id) {
    _isLoading = true;
    return postService.fetchPostDetails(id).then((value) {
      _isLoading = false;
      setPost(value);
    }).onError((error, stackTrace) {
      _isLoading = true;
      print("Error while fetching the post detail: ${error.toString()}");
    });
  }
}
