import 'package:domain/domain.dart';

import '../providers/auth_provider.dart';

class AuthRepositoryImpl implements AuthRepository{
  AuthRepositoryImpl({
    required AuthenticationProvider authProvider,
  })  : _authProvider = authProvider;
  final AuthenticationProvider _authProvider;
  @override
  Future<void> logout() {
    return _authProvider.logout();
  }
  @override
  Future<void> signIn(UserAuthPayload userAuthPayload) {
    return _authProvider.signIn(userAuthPayload);
  }
  @override
  Future<void> signUp(UserAuthPayload userAuthPayload) {
    return _authProvider.signUp(userAuthPayload);
  }
}