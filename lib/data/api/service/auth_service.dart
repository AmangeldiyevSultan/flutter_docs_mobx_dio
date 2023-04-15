import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_google_docs/constants.dart';
import 'package:flutter_google_docs/data/api/model/api_error.dart';
import 'package:flutter_google_docs/data/api/model/api_user.dart';
import 'package:flutter_google_docs/data/api/request/get_user_body.dart';
import 'package:flutter_google_docs/data/api/request/local_storage.dart';
import 'package:flutter_google_docs/domain/model/error_model.dart';

class AuthService {
  final LocalStorageRepository _localStorageRepository =
      LocalStorageRepository();

  final Dio _dio = Dio(
    BaseOptions(baseUrl: uri),
  );

  Future<ApiError> signInWithGoogle(GetUserBody body) async {
    ErrorModel error =
        ErrorModel(error: 'Some unexpected error occurred.', data: null);
    try {
      var response = await _dio.post('/api/signup',
          data: body.toApi(),
          options: Options(headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          }));
      switch (response.statusCode) {
        case 200:
          {
            final newUser = body.copyWith(
              uid: response.data['user']['_id'],
              token: response.data['token'],
            );
            error = ErrorModel(error: null, data: newUser);

            _localStorageRepository.setToken(newUser.token);
          }
          break;
      }
    } catch (e) {
      error = ErrorModel(error: e.toString(), data: null);
    }
    return ApiError.fromApi(error);
  }

  Future<ApiError> getUserData() async {
    ErrorModel error =
        ErrorModel(error: 'Some unexpected error occurred.', data: null);
    try {
      String? token = await _localStorageRepository.getToken();
      if (token != null) {
        var response = await _dio.get('/',
            options: Options(headers: {
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': token,
            }));
        switch (response.statusCode) {
          case 200:
            final newUser = ApiUser.fromApi(response.data);
            error = ErrorModel(error: null, data: newUser);
            _localStorageRepository.setToken(newUser.token);
            break;
        }
      }
    } catch (e) {
      error = ErrorModel(
        error: e.toString(),
        data: null,
      );
    }
    return ApiError.fromApi(error);
  }
}
