import '../models/post.dart';

abstract class PostDataSource {
  Future<List<Post>> getAllPost();
  Future<Post> getPostById(int id);
  Future<Post> createPost(Post post);
  Future<Post> updatePost(Post post);
}
