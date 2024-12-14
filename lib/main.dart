import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_flutter/data/post_data_source/fake_post_data_source.dart';
import 'package:tp_flutter/data/repository/post_repository.dart';
import 'package:tp_flutter/post_screen/post_bloc/post_bloc.dart';
import 'package:tp_flutter/post_screen/post_screen.dart';

void main() {
  final postRepository = PostRepository(
    remoteDataSource: FakePostDataSource(),
  );

  runApp(
    BlocProvider(
      create: (_) => PostBloc(postRepository: postRepository),
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final postRepository = PostRepository(
      remoteDataSource: FakePostDataSource(),
    );

    return BlocProvider(
      create: (_) => PostBloc(postRepository: postRepository),
      child: MaterialApp(
        title: 'Posts App',
        theme: ThemeData(
          primarySwatch: Colors.blue, 
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), 
            ),
            elevation: 4, 
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), 
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            bodyMedium: TextStyle(
              color: Colors.black87, 
              fontSize: 14,
            ),
          ),
        ),
        home: const PostsScreen(),
      ),
    );
  }
}
