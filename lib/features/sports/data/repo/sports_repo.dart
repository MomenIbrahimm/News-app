import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/core/networking/api_result.dart';
import 'package:news_app/core/networking/api_services.dart';
import 'package:news_app/features/business/data/model/news_model.dart';

import '../../../../core/errors/api_error_handler.dart';

class SportsRepo {
  final ApiService apiService;

  SportsRepo(this.apiService);

  Future<ApiResult<NewsModel>> getSportsData() async {
    try {
      log('getSportsData');
      final response =
          await apiService.getData(endPoint: 'v2/top-headlines', query: {
        'category': 'sports',
        'country': 'us',
        'apiKey': 'da2217f76a4b4a499b2d4a56efedd6e5',
      });

      log(response.toString());
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
