import 'package:dio/dio.dart';
import 'package:news_app/core/networking/api_result.dart';
import 'package:news_app/core/networking/api_services.dart';
import 'package:news_app/features/business/data/model/news_model.dart';

import '../../../../core/errors/api_error_handler.dart';

class SearchRepo {
  final ApiService apiService;

  SearchRepo(this.apiService);

  Future<ApiResult<NewsModel>> searchNews({required String text}) async {
    try {
      var response = await apiService.getData(
        endPoint: 'v2/everything',
        query: {
          'q': text,
          'apiKey': 'da2217f76a4b4a499b2d4a56efedd6e5',
          'sortBy': 'publishedAt',
          'tBy': 'popularity',
        },
      );
      return ApiResult.success(NewsModel.fromJson(response));
    } catch (error) {
      if (error is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(error.toString()));
      } else {
        return ApiResult.failure(ServerFailure(error.toString()));
      }
    }
  }
}
