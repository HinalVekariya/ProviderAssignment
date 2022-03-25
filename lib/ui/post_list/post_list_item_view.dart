import 'package:flutter/material.dart';
import 'package:provider_assignment/model/post.dart';
import 'package:provider_assignment/ui/post_detail/post_detail_screen.dart';

class PostListItemView extends StatefulWidget {
  final Post post;

  const PostListItemView({Key? key, required this.post}) : super(key: key);

  @override
  State<PostListItemView> createState() => _PostListItemViewState();
}

class _PostListItemViewState extends State<PostListItemView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(8),
      child: InkWell(
        focusColor: Colors.white38,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostDetailScreen(id: widget.post.id),
              ));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.post.id.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  )),
              Expanded(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.post.body.toString()),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
