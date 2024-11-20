import '../payloads/payloads.dart';

abstract class AuthRepository {
  Future<String> signIn(UserAuthPayload payload);

  Future<String> signUp(UserAuthPayload payload);

  Future<void> logout();
}
