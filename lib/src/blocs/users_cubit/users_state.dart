part of 'users_cubit.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState.loading() = _loading;
  const factory UsersState.data({
    List<UserModel>? users,
  }) = _data;
  const factory UsersState.error() = _error;
}
