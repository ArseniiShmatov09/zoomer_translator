import 'package:domain/domain.dart';

abstract class AuthenticationProvider {
  Future<void> signIn(UserAuthPayload payload);

  Future<void> signUp(UserAuthPayload payload);

  Future<void> logout();

  Future<String?> getCurrentUserToken();
}
