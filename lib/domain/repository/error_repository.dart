import 'package:flutter_google_docs/domain/model/error_model.dart';

abstract class ErrorRepository {
  Future<ErrorModel> signInWithGoogle();
  Future<ErrorModel> getUserData();
}
