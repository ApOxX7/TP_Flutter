import 'package:flutter/material.dart';

import '../../data/models/post.dart';

class CreatePostForm extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  CreatePostForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Créer un nouveau post'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Titre'),
          ),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: () {
            final newPost = Post(
              id: DateTime.now().millisecondsSinceEpoch,
              title: _titleController.text,
              description: _descriptionController.text,
            );
            Navigator.of(context).pop(newPost);
          },
          child: const Text('Créer'),
        ),
      ],
    );
  }
}