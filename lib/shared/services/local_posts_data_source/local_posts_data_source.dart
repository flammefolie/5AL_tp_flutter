import '../../models/post.dart';

abstract class LocalPostsDataSource {
  Future<List<Post>> getAllPosts();

  Future<void> addPost(Post post);

  Future<void> updatePost(Post updatedPost);
}
