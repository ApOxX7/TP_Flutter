import 'package:tp_flutter/data/models/post.dart';

abstract class PostEvent {}

class GetAllPostsEvent extends PostEvent {}

class AddPostEvent extends PostEvent {
  final Post post;

  AddPostEvent(this.post);
}

class UpdatePostEvent extends PostEvent {
  final Post post;

  UpdatePostEvent(this.post);
}

class DeletePostEvent extends PostEvent {
  final int postId;

  DeletePostEvent(this.postId);
}