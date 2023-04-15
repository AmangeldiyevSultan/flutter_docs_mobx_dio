import 'package:flutter/material.dart';
import 'package:flutter_google_docs/domain/model/error_model.dart';
import 'package:flutter_google_docs/domain/state/login_state.dart';
import 'package:flutter_google_docs/router.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:routemaster/routemaster.dart';

import 'dependencies/login_module.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  ErrorModel? errorModel;
  LoginState? _loginState;

  @override
  void initState() {
    super.initState();
    _loginState = LoginModule.loginState();
    getUserData();
  }

  void getUserData() async {
    await _loginState!.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerDelegate: RoutemasterDelegate(routesBuilder: (context) {
          if (_loginState!.errorModel != null &&
              _loginState!.errorModel!.data!.token.isNotEmpty) {
            return loggedInRoute;
          }
          return loggedOutRoute;
        }),
        routeInformationParser: const RoutemasterParser(),
      );
    });
  }
}
