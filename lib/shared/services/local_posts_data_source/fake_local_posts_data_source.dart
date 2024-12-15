import 'package:tp_flutter_posts/app_exception.dart';

import '../../models/post.dart';
import 'local_posts_data_source.dart';

class FakeLocalPostsDataSource extends LocalPostsDataSource {
  final List<Post> _fakePosts = [
    Post(id: 1, title: 'Exploring the Mountains', description: 'A guide to hiking in the Alps during summer.'),
    Post(id: 2, title: 'Top 5 Coding Tips', description: 'Boost your productivity with these essential coding tips.'),
    Post(id: 3, title: 'The Future of AI', description: 'Insights into how AI will shape the next decade.'),
    Post(id: 4, title: 'Healthy Eating Habits', description: 'Quick and practical tips for a balanced diet.'),
    Post(id: 5, title: 'Traveling on a Budget', description: 'Discover affordable travel hacks for your next trip.'),
    Post(id: 6, title: 'Mastering Flutter', description: 'A beginner’s guide to building apps with Flutter.'),
    Post(id: 7, title: 'Photography Basics', description: 'Learn how to capture stunning photos with any camera.'),
    Post(id: 8, title: 'Top Netflix Shows', description: 'Must-watch series to binge this weekend.'),
    Post(id: 9, title: 'Improving Mental Health', description: 'Daily habits to maintain a positive mindset.'),
    Post(id: 10, title: 'Workout Plans for Beginners', description: 'Simple exercises to start your fitness journey.'),
  ];

  @override
  Future<List<Post>> getAllPosts() async {
    await Future.delayed(const Duration(seconds: 1));
    return _fakePosts;
  }

  @override
  Future<void> addPost(Post post) async {
    await Future.delayed(const Duration(seconds: 1));
    _fakePosts.add(post);
  }

  @override
  Future<void> updatePost(Post updatedPost) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = _fakePosts.indexWhere((post) => post.id == updatedPost.id);
    if (index != -1) {
      _fakePosts[index] = updatedPost;
    } else {
      throw PostNotFoundException();
    }
  }
}
