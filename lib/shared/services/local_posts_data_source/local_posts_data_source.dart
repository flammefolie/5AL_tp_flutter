import '../../../models/post.dart';

abstract class LocalPostsDataSource {
  Future<List<Post>> getAllPosts();

  Future<void> save(List<Post> posts);
}
