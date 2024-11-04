part of 'post_cubit.dart';

@freezed
class PostState with _$PostState {
  const factory PostState.loading() = _loading;
  const factory PostState.data({
    List<PostModel>? posts,
  }) = _data;
  const factory PostState.error() = _error;
}
