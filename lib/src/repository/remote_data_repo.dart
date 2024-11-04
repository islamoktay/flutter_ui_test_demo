import 'package:flutter_ui_test_demo/app/service/network_service.dart';
import 'package:flutter_ui_test_demo/src/model/post_model.dart';
import 'package:flutter_ui_test_demo/src/model/user_model.dart';

const baseUrl = 'https://jsonplaceholder.typicode.com/';

class RemoteDataRepo {
  RemoteDataRepo() : networkService = NetworkService();

  final NetworkService networkService;
  Future<List<UserModel>> getUsers() async {
    final data = await networkService(path: '${baseUrl}users');

    final users = (data as List)
        .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return users;
  }

  Future<List<PostModel>> getPosts() async {
    final data = await networkService(path: '${baseUrl}posts');

    final posts = (data as List)
        .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return posts;
  }
}
