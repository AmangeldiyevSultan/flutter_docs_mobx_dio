// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginState on LoginStateBase, Store {
  late final _$errorModelAtom =
      Atom(name: 'LoginStateBase.errorModel', context: context);

  @override
  ErrorModel? get errorModel {
    _$errorModelAtom.reportRead();
    return super.errorModel;
  }

  @override
  set errorModel(ErrorModel? value) {
    _$errorModelAtom.reportWrite(value, super.errorModel, () {
      super.errorModel = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'LoginStateBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$signInWithGoogleAsyncAction =
      AsyncAction('LoginStateBase.signInWithGoogle', context: context);

  @override
  Future<void> signInWithGoogle(dynamic context) {
    return _$signInWithGoogleAsyncAction
        .run(() => super.signInWithGoogle(context));
  }

  late final _$getUserDataAsyncAction =
      AsyncAction('LoginStateBase.getUserData', context: context);

  @override
  Future<void> getUserData() {
    return _$getUserDataAsyncAction.run(() => super.getUserData());
  }

  @override
  String toString() {
    return '''
errorModel: ${errorModel},
isLoading: ${isLoading}
    ''';
  }
}
