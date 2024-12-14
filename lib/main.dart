import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_flutter_posts/posts_screen/posts_bloc/posts_bloc.dart';
import 'package:tp_flutter_posts/posts_screen/posts_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc(),
      child: const MaterialApp(
        home: PostsScreen(),
      ),
    );
  }
}
