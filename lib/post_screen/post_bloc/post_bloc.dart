import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_flutter/data/repository/post_repository.dart';
import 'package:tp_flutter/post_screen/post_bloc/post_event.dart';
import 'package:tp_flutter/post_screen/post_bloc/post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc({required this.postRepository}) : super(const PostState()) {
    on<GetAllPostsEvent>(_onGetAllPostsEvent);
    on<AddPostEvent>(_onAddPostEvent);
    on<UpdatePostEvent>(_onUpdatePostEvent);
  }

  Future<void> _onGetAllPostsEvent(
      GetAllPostsEvent event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: PostStatus.loading));
    try {
      final posts = await postRepository.getAllPost();
      emit(state.copyWith(status: PostStatus.success, posts: posts));
    } catch (error) {
      emit(state.copyWith(
          status: PostStatus.error, errorMessage: error.toString()));
    }
  }

  Future<void> _onAddPostEvent(
      AddPostEvent event, Emitter<PostState> emit) async {
    try {
      await postRepository.createPost(event.post);
      add(GetAllPostsEvent()); 
    } catch (error) {
      emit(state.copyWith(
          status: PostStatus.error, errorMessage: error.toString()));
    }
  }

  Future<void> _onUpdatePostEvent(
      UpdatePostEvent event, Emitter<PostState> emit) async {
    try {
      await postRepository.updatePost(event.post);
      add(GetAllPostsEvent()); 
    } catch (error) {
      emit(state.copyWith(
          status: PostStatus.error, errorMessage: error.toString()));
    }
  }
}