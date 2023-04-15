import 'package:flutter/material.dart';
import 'package:flutter_google_docs/domain/model/error_model.dart';
import 'package:flutter_google_docs/domain/repository/error_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:routemaster/routemaster.dart';

part 'login_state.g.dart';

class LoginState = LoginStateBase with _$LoginState;

abstract class LoginStateBase with Store {
  LoginStateBase(this._errorRepository);

  final ErrorRepository _errorRepository;

  @observable
  ErrorModel? errorModel;

  @observable
  bool isLoading = false;

  @action
  Future<void> signInWithGoogle(context) async {
    isLoading = true;
    final sMessenger = ScaffoldMessenger.of(context);
    final navigator = Routemaster.of(context);
    final data = await _errorRepository.signInWithGoogle();
    errorModel = data;
    isLoading = false;
    if (errorModel!.error == null) {
      navigator.replace('/');
    } else {
      sMessenger.showSnackBar(
        SnackBar(
          content: Text(errorModel!.error!),
        ),
      );
    }
  }

  @action
  Future<void> getUserData() async {
    final data = await _errorRepository.getUserData();
    if (data.data != null) {
      errorModel = data;
    }
  }
}
