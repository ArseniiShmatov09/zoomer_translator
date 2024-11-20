import 'package:domain/domain.dart';

import '../providers/auth_provider.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthenticationProvider authProvider,
  }) : _authProvider = authProvider;
  final AuthenticationProvider _authProvider;

  @override
  Future<void> logout() {
    return _authProvider.logout();
  }

  @override
  Future<String> signIn(UserAuthPayload payload) {
    return _authProvider.signIn(payload);
  }

  @override
  Future<String> signUp(UserAuthPayload payload) {
    return _authProvider.signUp(payload);
  }
}