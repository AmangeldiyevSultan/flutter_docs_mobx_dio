import 'package:flutter_google_docs/data/api/model/api_error.dart';
import 'package:flutter_google_docs/data/api/request/get_user_body.dart';
import 'package:flutter_google_docs/data/api/service/auth_service.dart';
import 'package:flutter_google_docs/data/mapper/error_mapper.dart';
import 'package:flutter_google_docs/domain/model/error_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ApiUtil {
  final AuthService _authService;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  ApiUtil(this._authService);

  Future<ErrorModel> signInWithGoogle() async {
    final user = await _googleSignIn.signIn();
    final body = GetUserBody(
        email: user?.email ?? '',
        name: user?.displayName ?? '',
        profilePic: user?.photoUrl ?? '',
        uid: '',
        token: '');
    final result = await _authService.signInWithGoogle(body);
    return ErrorMapper.fromApi(result);
  }

  Future<ErrorModel> getUserData() async {
    final result = await _authService.getUserData();
    return ErrorMapper.fromApi(result);
  }
}
