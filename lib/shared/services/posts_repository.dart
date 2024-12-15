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
      rethrow; //permet à l'appelant de savoir qu'il y a une erreur côté récupération des posts, et donc de différencier l'erreur du résultat vide.
      //si jamais on utilisait une source externe, une logique supplémentaire devrait être ajoutée.
    }
  }
}
