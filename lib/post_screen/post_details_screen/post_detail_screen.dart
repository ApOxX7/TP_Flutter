import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_flutter/post_screen/post_details_screen/edit_post_form.dart';
import 'package:tp_flutter/post_screen/post_bloc/post_bloc.dart';
import 'package:tp_flutter/post_screen/post_bloc/post_event.dart';
import '../../../data/models/post.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;

  const PostDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              _editPost(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              post.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Description:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              post.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void _editPost(BuildContext context) async {
    final postBloc =
        context.read<PostBloc>();

    final updatedPost = await showDialog<Post>(
      context: context,
      builder: (context) => EditPostForm(post: post),
    );

    if (updatedPost != null) {
      postBloc.add(UpdatePostEvent(updatedPost));
    }
    
  }
}