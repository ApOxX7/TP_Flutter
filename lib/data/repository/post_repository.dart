import 'package:tp_flutter/data/models/post.dart';
import 'package:tp_flutter/data/post_data_source/post_data_source.dart';

class PostRepository {
  final PostDataSource remoteDataSource;

  PostRepository({
    required this.remoteDataSource,
  });

  Future<List<Post>> getAllPost() async {
    return remoteDataSource.getAllPost();
  }

  Future<Post> getPostById(int id) async {
    return remoteDataSource.getPostById(id);
  }

  Future<Post> createPost(Post post) async {
    return remoteDataSource.createPost(post);
  }

  Future<Post> updatePost(Post post) async {
    return remoteDataSource.updatePost(post);
  }
}
