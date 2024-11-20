import 'package:domain/domain.dart';

abstract class AuthenticationProvider {
  Future<String> signIn(UserAuthPayload payload);

  Future<String> signUp(UserAuthPayload payload);

  Future<void> logout();
}
