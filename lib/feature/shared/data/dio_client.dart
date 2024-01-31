import 'package:dio/dio.dart';

final class DioClient {
  late final Dio _dio = Dio();

  Future<T> fetch<T>({required Uri uri}) async {
    final response = await _dio.getUri<T>(uri);
    return response.data as T;
  }
}
