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
<<<<<<< HEAD
  Future<void> signIn(UserAuthPayload payload) {
    return _authProvider.signIn(payload);
  }
  @override
  Future<void> signUp(UserAuthPayload payload) {
    return _authProvider.signUp(payload);
=======
  Future<String> signIn(UserAuthPayload userAuthPayload) {
    return _authProvider.signIn(userAuthPayload);
  }
  @override
  Future<String> signUp(UserAuthPayload userAuthPayload) {
    return _authProvider.signUp(userAuthPayload);
>>>>>>> 9f504f845f8fa0f6c6cedf4cc4ca273ea3a01537
  }
}