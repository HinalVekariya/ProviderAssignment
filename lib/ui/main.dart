import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_assignment/service/post_service.dart';
import 'package:provider_assignment/ui/post_detail_screen.dart';
import 'package:provider_assignment/ui/post_list_screen.dart';
import 'package:provider_assignment/viewmodel/post_list_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
            create: (_) => Dio(
                BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"))),
        ProxyProvider<Dio, PostService>(
          update: (context, dio, postService) => PostService(dio),
        ),
        ChangeNotifierProvider(
            create: (context) => PostListViewModel(
                Provider.of<PostService>(context, listen: false))),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const PostListScreen(),
          '/detail' :(context) => const PostDetailScreen()
        }
      ),
    );
  }
}
