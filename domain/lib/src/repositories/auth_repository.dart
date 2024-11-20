import '../payloads/payloads.dart';

abstract class AuthRepository {
<<<<<<< HEAD
  Future<void> signIn(UserAuthPayload payload);

  Future<void> signUp(UserAuthPayload payload);
=======
  Future<String> signIn(UserAuthPayload userAuthPayload);

  Future<String> signUp(UserAuthPayload userAuthPayload);
>>>>>>> 9f504f845f8fa0f6c6cedf4cc4ca273ea3a01537

  Future<void> logout();
}
