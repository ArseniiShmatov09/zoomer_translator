import 'package:domain/domain.dart';

abstract class AuthenticationProvider {
  Future<void> signIn(UserAuthPayload userAuthPayload);

  Future<void> signUp(UserAuthPayload userAuthPayload);

  Future<void> logout();
}
