import 'package:dio/dio.dart';

import 'api_constance.dart';

class ApiService {
  final _baseUrl = EndPoints.baseUrl;
  final Dio _dio;

  ApiService(this._dio);

  Future<dynamic> getData({
    String? endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    var response = await _dio.get(
      '$_baseUrl$endPoint',
      queryParameters: query,
      data: data,
    );

/*    _dio.interceptors.add(PrettyDioLogger());

    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          if (options.path.contains('/posts')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        }));*/

    return response.data;
  }
}
