import '../payloads/payloads.dart';

abstract class AuthRepository {
  Future<void> signIn(UserAuthPayload userAuthPayload);

  Future<void> signUp(UserAuthPayload userAuthPayload);

  Future<void> logout();
}
