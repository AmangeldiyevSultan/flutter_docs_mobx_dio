import 'package:flutter_google_docs/domain/model/error_model.dart';

class ApiError {
  final String? error;
  final dynamic data;

  ApiError.fromApi(ErrorModel map)
      : error = map.error,
        data = map.data;
}
