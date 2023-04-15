import 'package:flutter_google_docs/data/api/api_utils.dart';
import 'package:flutter_google_docs/domain/model/error_model.dart';
import 'package:flutter_google_docs/domain/model/user_model.dart';
import 'package:flutter_google_docs/domain/repository/error_repository.dart';
import 'package:flutter_google_docs/domain/repository/user_repository.dart';

class AuthDataRepository extends ErrorRepository {
  final ApiUtil _apiUtil;

  AuthDataRepository(this._apiUtil);

  @override
  Future<ErrorModel> signInWithGoogle() {
    return _apiUtil.signInWithGoogle();
  }

  @override
  Future<ErrorModel> getUserData() {
    return _apiUtil.getUserData();
  }
}
