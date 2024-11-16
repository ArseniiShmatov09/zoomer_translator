import '../payloads/payloads.dart';

abstract class AuthRepository {
  Future<String> signIn(UserAuthPayload userAuthPayload);

  Future<String> signUp(UserAuthPayload userAuthPayload);

  Future<void> logout();
}
