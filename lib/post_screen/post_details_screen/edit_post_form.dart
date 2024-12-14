

import 'package:flutter/material.dart';
import 'package:tp_flutter/data/models/post.dart';

class EditPostForm extends StatefulWidget {
  final Post post;

  const EditPostForm({super.key, required this.post});

  @override
  State<EditPostForm> createState() => EditPostFormState();
}

class EditPostFormState extends State<EditPostForm> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.post.title);
    _descriptionController = TextEditingController(text: widget.post.description);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Post'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
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
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final updatedPost = Post(
              id: widget.post.id,
              title: _titleController.text,
              description: _descriptionController.text,
            );
            Navigator.of(context).pop(updatedPost); 
          },
          child: const Text('Save'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}