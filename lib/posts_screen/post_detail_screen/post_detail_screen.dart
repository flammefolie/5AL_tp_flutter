import 'package:flutter/material.dart';

import '../../shared/models/post.dart';
import '../edit_post_screen/edit_post_screen.dart';

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
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _editPost(context),
          ),
        ],
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

  void _editPost(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditPostScreen(post: post),
      ),
    );
  }
}
