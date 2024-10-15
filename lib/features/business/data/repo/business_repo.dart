import 'package:dio/dio.dart';
import 'package:news_app/core/networking/api_services.dart';
import 'package:news_app/features/business/data/model/business_model.dart';

import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';

class BusinessRepo {
  final ApiService apiService;

  BusinessRepo(this.apiService);

  Future<ApiResult<BusinessModel>> getBusinessData() async {
    try {
      final response =
          await apiService.getData(endPoint: 'v2/top-headlines', query: {
        'category': 'business',
        'country': 'us',
        'apiKey': 'da2217f76a4b4a499b2d4a56efedd6e5',
      });
      return ApiResult.success(BusinessModel.fromJson(response));
    } catch (error) {
      if (error is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(error));
      } else {
        return ApiResult.failure(ServerFailure(error.toString()));
      }
    }
  }
}
