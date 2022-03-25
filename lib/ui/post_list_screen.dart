import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_assignment/viewmodel/post_list_view_model.dart';
import 'package:provider_assignment/ui/post_view.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  @override
  void initState() {
    PostListViewModel postListViewModel =
        Provider.of<PostListViewModel>(context, listen: false);
    postListViewModel.getPostList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PostList"),),
      body: ChangeNotifierProvider.value(
        value: Provider.of<PostListViewModel>(context, listen: false),
        child: Consumer<PostListViewModel>(
          builder: (context, postListViewModel, child) {
            return postListViewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: postListViewModel.postList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PostView(post: postListViewModel.postList[index]);
                    });
          },
        ),
      ),
    );
  }
}
