import 'package:flutter_google_docs/data/api/model/api_user.dart';
import 'package:flutter_google_docs/domain/model/user_model.dart';

class UserMapper {
  static UserModel fromApi(ApiUser user) {
    return UserModel(
        email: user.email,
        name: user.name,
        profilePic: user.profilePic,
        uid: user.uid,
        token: user.token);
  }
}
