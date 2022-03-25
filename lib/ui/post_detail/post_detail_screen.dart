import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_assignment/view_model/post_detail_view_model.dart';

class PostDetailScreen extends StatefulWidget {
  final int id;

  const PostDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  void initState() {
    PostDetailViewModel postDetailViewModel =
        Provider.of<PostDetailViewModel>(context, listen: false);
    postDetailViewModel.getPostDetail(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Detail"),
      ),
      body: ChangeNotifierProvider.value(
        value: Provider.of<PostDetailViewModel>(context, listen: false),
        child: Consumer<PostDetailViewModel>(
          builder: (context, postDetailViewModel, child) {
            return postDetailViewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichTextView(
                            tag: "UserId: ",
                            value: postDetailViewModel.post.userId.toString()),
                        const SizedBox(height: 10),
                        RichTextView(
                            tag: "Id: ",
                            value: postDetailViewModel.post.id.toString()),
                        const SizedBox(height: 10),
                        RichTextView(
                            tag: "Title: ",
                            value: postDetailViewModel.post.title),
                        const SizedBox(height: 10),
                        RichTextView(
                            tag: "Body: ", value: postDetailViewModel.post.body)
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}

class RichTextView extends StatelessWidget {
  final String tag;
  final String value;

  const RichTextView({Key? key, required this.tag, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
            children: <TextSpan>[
          TextSpan(
              text: tag, style: const TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: value)
        ]));
  }
}
