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
  Future<void> signIn(UserAuthPayload payload) {
    return _authProvider.signIn(payload);
  }

  @override
  Future<void> signUp(UserAuthPayload payload) {
    return _authProvider.signUp(payload);
  }

  @override
  Future<String?> getLoggedInUser() async {
    return _authProvider.getCurrentUserToken();
  }

  @override
  Future<String> getCurrentUserId() async {
    return _authProvider.getCurrentUserId();
  }
}