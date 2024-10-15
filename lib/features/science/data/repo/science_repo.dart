import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/core/networking/api_result.dart';
import 'package:news_app/core/networking/api_services.dart';
import 'package:news_app/features/business/data/model/news_model.dart';

import '../../../../core/errors/api_error_handler.dart';

class ScienceRepo {
  final ApiService apiService;

  ScienceRepo(this.apiService);

  Future<ApiResult<NewsModel>> getScienceData() async {
    try {
      final response =
          await apiService.getData(endPoint: 'v2/top-headlines', query: {
        'category': 'science',
        'country': 'us',
        'apiKey': 'da2217f76a4b4a499b2d4a56efedd6e5',
      });

      return ApiResult.success(NewsModel.fromJson(response));
    } catch (error) {
      if (error is DioException) {
        log("Dio Error: ------>$error");
        return ApiResult.failure(ServerFailure.fromDioError(error));
      } else {
        log(error.toString());
        return ApiResult.failure(ServerFailure(error.toString()));
      }
    }
  }
}
