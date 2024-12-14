import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_flutter/post_screen/create_post_form.dart';
import 'package:tp_flutter/data/models/post.dart';
import 'package:tp_flutter/post_screen/post_details_screen/post_detail_screen.dart';
import 'package:tp_flutter/post_screen/post_bloc/post_event.dart';
import 'package:tp_flutter/post_screen/post_list_item/post_list_item.dart';
import 'package:tp_flutter/post_screen/post_bloc/post_state.dart';

import 'post_bloc/post_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
    _getAllPosts();
  }

  void _getAllPosts() {
    context.read<PostBloc>().add(GetAllPostsEvent());
  }

  void _createNewPost(BuildContext context) async {
    final postBloc =
        context.read<PostBloc>();

    final result = await showDialog<Post>(
      context: context,
      builder: (context) => CreatePostForm(),
    );

    if (result != null) {
      postBloc.add(AddPostEvent(result));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.refresh),
        //     onPressed: _getAllPosts,
        //   ),
        // ], // essayer de le mettre sur le scroll vers le bas 
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.status) {
            case PostStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case PostStatus.error:
              return Center(child: Text('Erreur : ${state.errorMessage}'));
            case PostStatus.success:
              return _buildSuccess(context, state.posts);
            case PostStatus.initial:
            default:
              return const Center(child: Text('Aucun post trouvé.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createNewPost(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSuccess(BuildContext context, List<Post> posts) {
  return RefreshIndicator(
    onRefresh: () async => _getAllPosts(),
    child: ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return PostListItem(
          post: post,
          onTap: () => _openPostDetailScreen(context, post),
        );
      },
    ),
  );
}

  void _openPostDetailScreen(BuildContext context, Post post) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => PostDetailScreen(post: post),
    ),
  );
}
}
