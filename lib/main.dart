import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_flutter_posts/posts_screen/posts_bloc/posts_bloc.dart';
import 'package:tp_flutter_posts/posts_screen/posts_screen.dart';
import 'package:tp_flutter_posts/shared/services/local_posts_data_source/fake_local_posts_data_source.dart';
import 'package:tp_flutter_posts/shared/services/posts_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PostsRepository(
        localDataSource: FakeLocalPostsDataSource(),
      ),
      child: BlocProvider(
        create: (context) => PostsBloc(
          postsRepository: context.read<PostsRepository>(),
        ),
        child: const MaterialApp(
          home: PostsScreen(),
        ),
      ),
    );
  }
}
