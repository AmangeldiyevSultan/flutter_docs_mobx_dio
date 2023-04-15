import 'package:flutter_google_docs/data/api/model/api_error.dart';
import 'package:flutter_google_docs/domain/model/error_model.dart';

class ErrorMapper {
  static ErrorModel fromApi(ApiError error) {
    return ErrorModel(error: error.error, data: error.data);
  }
}
