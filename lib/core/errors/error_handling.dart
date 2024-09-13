import 'dart:io';

import 'package:dio/dio.dart';
import 'package:klontonk/core/core.dart';

mixin ErrorHandling {
  Result<T, Exception> handleException<T>(Exception error) {
    if (error is DioException) {
      if (error.type == DioExceptionType.connectionError) {
        return Failure(InternetFailure());
      } else if (error.response?.statusCode == HttpStatus.badRequest) {
        if (error.response?.data is Map<String, dynamic>) {
          return Failure(
            RequestFailure.fromJson(
              error.response?.data as Map<String, dynamic>,
            ),
          );
        }
        return Failure(ServerFailure(message: error.toString()));
      }
      if (error.response?.data is Map<String, dynamic>) {
        return Failure(
          ServerFailure.fromJson(
            error.response?.data as Map<String, dynamic>,
          ),
        );
      }
      return Failure(ServerFailure(message: error.toString()));
    } else if (error is SocketException) {
      return Failure(InternetFailure());
    } else if (error is FormatException) {
      return Failure(FormatFailure(message: error.toString()));
    }
    return Failure(ServerFailure(message: error.toString()));
  }
}
