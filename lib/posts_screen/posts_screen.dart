import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_flutter_posts/posts_screen/post_detail_screen/post_detail_screen.dart';
import 'package:tp_flutter_posts/posts_screen/posts_bloc/posts_bloc.dart';

import '../app_exception.dart';
import '../shared/models/post.dart';

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
            PostsStatus.loading ||
            PostsStatus.initial =>
              _buildLoading(context),
            PostsStatus.error => _buildError(context, state.exception),
            PostsStatus.empty => _buildEmpty(context),
            PostsStatus.success => _buildSuccess(context, state.posts),
          };
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onCreatePostTap(context),
        child: const Icon(Icons.add),
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
      child: Text('Error building posts page: $exception'),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return const Center(
      child: Text('No posts available ! Try to create some posts :)'),
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
            onTap: () => _onPostTap(context, post),
          );
        },
      ),
    );
  }

  void _getAllPosts() {
    final postsBloc = BlocProvider.of<PostsBloc>(context);
    postsBloc.add(GetAllPosts());
  }

  void _onPostTap(BuildContext context, Post post) {
    PostDetailScreen.navigateTo(context, post);
  }

  void _onCreatePostTap(BuildContext context) {
    Navigator.pushNamed(context, 'createPost');
  }
}
