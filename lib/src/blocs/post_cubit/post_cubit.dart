import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_ui_test_demo/src/model/post_model.dart';
import 'package:flutter_ui_test_demo/src/repository/remote_data_repo.dart';

part 'post_state.dart';
part 'post_cubit.freezed.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit(this.remoteDataRepo) : super(const PostState.loading());

  final RemoteDataRepo remoteDataRepo;

  Future<void> getPosts() async {
    try {
      final posts = await remoteDataRepo.getPosts();

      emit(PostState.data(posts: posts));
    } catch (_) {
      emit(const PostState.error());
    }
  }
}
