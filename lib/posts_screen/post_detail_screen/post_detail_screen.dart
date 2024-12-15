import 'package:flutter/material.dart';

import '../../shared/models/post.dart';

class PostDetailScreen extends StatelessWidget {
  static Future<void> navigateTo(BuildContext context, Post post) {
    return Navigator.pushNamed(context, 'postDetail', arguments: post);
  }

  const PostDetailScreen({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
