part of 'posts_bloc.dart';

@immutable
sealed class PostsEvent {}

class GetAllPosts extends PostsEvent {}

class CreatePost extends PostsEvent {
  final Post post;

  CreatePost({required this.post});
}
