import 'package:flutter_google_docs/data/api/api_utils.dart';
import 'package:flutter_google_docs/data/api/service/auth_service.dart';

class ApiModule {
  static ApiUtil? _apiUtil;

  static ApiUtil apiUtil() {
    _apiUtil ??= ApiUtil(AuthService());
    return _apiUtil!;
  }
}
