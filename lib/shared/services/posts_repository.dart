import '../../models/post.dart';
import 'local_posts_data_source/local_posts_data_source.dart';

class PostsRepository {
  final LocalPostsDataSource localDataSource;

  const PostsRepository({
    required this.localDataSource,
  });

  Future<List<Post>> getAllPosts() async {
    try {
      return await localDataSource.getAllPosts();
    } catch (error) {
      rethrow;
    }
  }
}
