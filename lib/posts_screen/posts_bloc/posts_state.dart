part of 'posts_bloc.dart';

enum PostsStatus {
  initial,
  loading,
  success,
  error,
}

class PostsState {
  final PostsStatus status;
  final List<Post> posts;
  final AppException? exception;

  const PostsState({
    this.status = PostsStatus.initial,
    this.posts = const [],
    this.exception,
  });
}
