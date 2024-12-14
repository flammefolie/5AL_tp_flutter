import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_flutter_posts/posts_screen/posts_bloc/posts_bloc.dart';

import '../app_exception.dart';
import '../models/post.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
    _getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            return switch (state.status) {
              PostsStatus.loading || PostsStatus.initial => _buildLoading(context),
              PostsStatus.error => _buildError(context, state.exception),
              PostsStatus.success => _buildSuccess(context, state.posts),
            };
          },
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError(BuildContext context, AppException? exception) {
    return Center(
      child: Text('Error: $exception'),
    );
  }

  Widget _buildSuccess(BuildContext context, List<Post> posts) {
    return RefreshIndicator(
      onRefresh: () async {
        _getAllPosts();
      },
      child: ListView.separated(
        itemCount: posts.length,
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemBuilder: (context, index) {
          final post = posts[index];
          return ListTile(
            title: Text(post.title),
            subtitle: Text(post.description),
          );
        },
      ),
    );
  }

  void _getAllPosts() {
    final postsBloc = BlocProvider.of<PostsBloc>(context);
    postsBloc.add(GetAllPosts());
  }
}
