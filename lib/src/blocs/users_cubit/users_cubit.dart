import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_ui_test_demo/src/model/user_model.dart';
import 'package:flutter_ui_test_demo/src/repository/remote_data_repo.dart';

part 'users_state.dart';
part 'users_cubit.freezed.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this.remoteDataRepo) : super(const UsersState.loading());

  final RemoteDataRepo remoteDataRepo;

  Future<void> getUsers() async {
    try {
      final users = await remoteDataRepo.getUsers();

      emit(UsersState.data(users: users));
    } catch (_) {
      emit(const UsersState.error());
    }
  }
}
