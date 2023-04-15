import 'package:flutter_google_docs/data/repository/auth_data_repository.dart';
import 'package:flutter_google_docs/internal/dependencies/api_module.dart';

class RepositoryModule {
  static AuthDataRepository? _authDataRepository;

  static AuthDataRepository authRepository() {
    _authDataRepository ??= AuthDataRepository(
      ApiModule.apiUtil(),
    );
    return _authDataRepository!;
  }
}
