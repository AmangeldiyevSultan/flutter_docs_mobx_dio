import 'package:flutter_google_docs/domain/state/login_state.dart';
import 'package:flutter_google_docs/internal/dependencies/repository_module.dart';

class LoginModule {
  static LoginState loginState() {
    return LoginState(
      RepositoryModule.authRepository(),
    );
  }
}
