import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../app_exception.dart';
import '../../models/post.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(const PostsState()) {
    on<GetAllPosts>((event, emit) async {
      try {
        emit(const PostsState(status: PostsStatus.loading));
        final posts = await _getPosts();
        emit(PostsState(
          posts: posts,
          status: PostsStatus.success,
        ));
      } catch (error) {
        final appException = AppException.from(error);
        emit(PostsState(
          status: PostsStatus.error,
          exception: appException,
        ));
      }
    });
  }

  List<Post> _getPosts() {
    List<Post> fakePosts = [
      Post(id: 1, title: 'Post 1', description: 'Description of post1'),
      Post(id: 2, title: 'Post 2', description: 'Description of post2'),
      Post(id: 3, title: 'Post 3', description: 'Description of post3'),
    ];
    return fakePosts;
  }
}
