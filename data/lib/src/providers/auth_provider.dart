import 'package:domain/domain.dart';

abstract class AuthenticationProvider {
  Future<String> signIn(UserAuthPayload userAuthPayload);

  Future<String> signUp(UserAuthPayload userAuthPayload);

  Future<void> logout();
}
