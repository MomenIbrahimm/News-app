import 'package:dio/dio.dart';

abstract class ErrorHandler {
  final String errMessage;

  const ErrorHandler(this.errMessage);
}

class ServerFailure extends ErrorHandler {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(dynamic error) {
    if (error is DioException) {
      ///connection Timeout 25dt fatra kbira gdn f 7asl timeout
      ///Send Timeout fdl yb3t fatra kbira gdn w mb3tsh 7aga w de t2ribn mo4kla f el network
      ///Recive Timeout fdl yb3t fatra kbira gdn w mb3tsh 7aga w de t2ribn mo4kla f el network
      ///Cancel el operation 2t3mlha cancel

      if (error.type == DioExceptionType.connectionTimeout) {
        return ServerFailure('Connection timeout');
      } else if (error.type == DioExceptionType.receiveTimeout) {
        return ServerFailure('Receive timeout');
      } else if (error.type == DioExceptionType.sendTimeout) {
        return ServerFailure('Send timeout');
      } else if (error.type == DioExceptionType.badResponse) {
        return ServerFailure.fromResponse(
            error.response!.statusCode!, error.response!.data!);
      } else if (error.type == DioExceptionType.cancel) {
        return ServerFailure('The request of ApiService was canceled');
      } else if (error.type == DioExceptionType.unknown) {
        if (error.message!.contains('SocketException')) {
          return ServerFailure('Connection failed due to internet connection');
        }
        return ServerFailure('Unexpected error, Please try again!');
      } else {
        return ServerFailure('Unknown error');
      }
    } else {
      return ServerFailure(
          'Opps there was an error, Please try later-----------------');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, Please try later!');
    } else {
      return ServerFailure('Opps there was an error, Please try later!');
    }
  }
}
