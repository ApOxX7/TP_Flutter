
import 'package:tp_flutter/data/models/post.dart';
import 'package:tp_flutter/data/post_data_source/post_data_source.dart';

class FakePostDataSource extends PostDataSource {
  
  final List<Post> _fakePosts = [
    Post(id: 1, title: 'Post 1', description: 'Description 1 il y a pas mal de texte pour voir si ça dépasse'),
    Post(id: 2, title: 'Post 2', description: 'Description 2 il y a pas mal de texte pour voir si ça dépasse'),
    Post(id: 3, title: 'Post 3', description: 'Description 3 il y a pas mal de texte pour voir si ça dépasse'),
    Post(id: 4, title: 'Post 4', description: 'Description 4 il y a pas mal de texte pour voir si ça dépasse'),
    Post(id: 5, title: 'Post 5', description: 'Description 5 il y a pas mal de texte pour voir si ça dépasse'),
  ];

  @override
  Future<List<Post>> getAllPost() async {
    await Future.delayed(const Duration(seconds: 1));
    return _fakePosts;
  }

  @override
  Future<Post> getPostById(int id) async {
    await Future.delayed(const Duration(seconds: 1));
    return _fakePosts.firstWhere((post) => post.id == id);
  }

  @override
  Future<Post> createPost(Post post) async {
    await Future.delayed(const Duration(seconds: 1));
    _fakePosts.add(post);
    return post;
  }

  @override
  Future<Post> updatePost(Post post) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = _fakePosts.indexWhere((p) => p.id == post.id);
    _fakePosts[index] = post;
    return post;
  }
}
