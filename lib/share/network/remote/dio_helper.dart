import 'package:dio/dio.dart';

class DioHelper {

  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }

 static Future<Response> getData(
      {required String url, Map<String, dynamic>? query,options}) async {
    return await dio.get(url, queryParameters: query,options: options);
  }
}
