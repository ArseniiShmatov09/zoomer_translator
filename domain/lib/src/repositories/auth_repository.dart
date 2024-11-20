import '../payloads/payloads.dart';

abstract class AuthRepository {
  Future<void> signIn(UserAuthPayload payload);

  Future<void> signUp(UserAuthPayload payload);

  Future<void> logout();
}
