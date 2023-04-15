import 'package:flutter_google_docs/domain/model/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getUser();
}
