import '../../models/post.dart';
import 'local_posts_data_source.dart';

class FakeLocalPostsDataSource extends LocalPostsDataSource {
  List<Post> _fakePosts = [
    Post(id: 10, title: 'Post 10', description: 'Description of post10'),
    Post(id: 20, title: 'Post 20', description: 'Description of post20'),
    Post(id: 33, title: 'Post 33', description: 'Description of post33'),
  ];

  @override
  Future<List<Post>> getAllPosts() async {
    await Future.delayed(const Duration(seconds: 1));
    return _fakePosts;
  }

  @override
  Future<void> save(List<Post> posts) async {
    _fakePosts = posts;
  }
}
