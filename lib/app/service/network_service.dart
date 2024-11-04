import 'package:dio/dio.dart';

enum RequestMethod { get }

class NetworkService {
  NetworkService() : dio = Dio();

  final Dio dio;
  Future<dynamic> call({
    required String path,
    RequestMethod method = RequestMethod.get,
  }) async {
    late Response<dynamic> response;

    switch (method) {
      case RequestMethod.get:
        response = await dio.get<dynamic>(path);
    }

    if (response.data == null) throw Exception('null data from network');

    switch (response.statusCode) {
      case 200:
        return response.data;

      default:
        throw Exception('error from network');
    }
  }
}
