import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tp_flutter_posts/shared/services/posts_repository.dart';

import '../../app_exception.dart';
import '../../models/post.dart';

part 'posts_event.dart';

part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository postsRepository;

  PostsBloc({required this.postsRepository}) : super(const PostsState()) {
    on<GetAllPosts>((event, emit) async {
      try {
        emit(state.copyWith(status: PostsStatus.loading));
        final posts = await postsRepository.getAllPosts();
        if (posts.isEmpty) {
          emit(state.copyWith(
            status: PostsStatus.empty,
          ));
        } else {
          emit(state.copyWith(
            posts: posts,
            status: PostsStatus.success,
          ));
        }
      } catch (error) {
        final appException = AppException.from(error);
        emit(state.copyWith(
          status: PostsStatus.error,
          exception: appException,
        ));
      }
    });
  }
}
