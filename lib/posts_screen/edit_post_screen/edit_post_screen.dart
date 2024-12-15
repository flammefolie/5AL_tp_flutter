import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/models/post.dart';
import '../posts_bloc/posts_bloc.dart';

class EditPostScreen extends StatefulWidget {
  final Post post;

  const EditPostScreen({super.key, required this.post});

  @override
  State<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.post.title);
    _descriptionController =
        TextEditingController(text: widget.post.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _savePost,
              child: const Text('Save changes'),
            ),
          ],
        ),
      ),
    );
  }

  void _savePost() {
    final updatedTitle = _titleController.text.trim();
    final updatedDescription = _descriptionController.text.trim();

    if (updatedTitle.isNotEmpty && updatedDescription.isNotEmpty) {
      final updatedPost = widget.post.copyWith(
        title: updatedTitle,
        description: updatedDescription,
      );

      context.read<PostsBloc>().add(UpdatePost(post: updatedPost));
      Navigator.pop(context);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all fields !')),
      );
    }
  }
}
