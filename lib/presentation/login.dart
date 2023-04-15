import 'package:flutter/material.dart';
import 'package:flutter_google_docs/colors.dart';
import 'package:flutter_google_docs/domain/state/login_state.dart';
import 'package:flutter_google_docs/internal/dependencies/login_module.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginState? _loginState;

  @override
  void initState() {
    super.initState();
    _loginState = LoginModule.loginState();
  }

  void _googleSignIn() {
    _loginState!.signInWithGoogle(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Observer(builder: (_) {
          if (_loginState!.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ElevatedButton.icon(
            onPressed: _googleSignIn,
            icon: Image.asset(
              'assets/images/g-logo-2.png',
              height: 20,
            ),
            label: const Text(
              'Sign in with Google',
              style: TextStyle(
                color: kBlackColor,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: kWhiteColor,
              minimumSize: const Size(150, 50),
            ),
          );
        }),
      ),
    );
  }
}
