import 'package:flutter/material.dart';
import 'package:tp_flutter_posts/posts_screen/posts_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PostsScreen(),
    );
  }
}
