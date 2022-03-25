import 'package:flutter/material.dart';
import 'package:provider_assignment/model/post.dart';
import 'package:provider_assignment/viewmodel/post_detail_view_model.dart';

class PostView extends StatefulWidget {
  final Post post;

  const PostView({Key? key, required this.post}) : super(key: key);

  @override
  State<PostView> createState() => _PostViewState(post);
}

class _PostViewState extends State<PostView> {
  late PostDetailViewModel postViewModel;
  late Post post;

  _PostViewState(this.post);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: null,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(post.title,style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
