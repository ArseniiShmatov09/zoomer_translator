import 'package:data/src/providers/auth_provider.dart';
import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProviderImpl implements AuthenticationProvider {
  final User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
<<<<<<< HEAD
  Future<void> signIn(UserAuthPayload payload) async {
=======
  Future<String> signIn(UserAuthPayload userAuthPayload) async {
>>>>>>> 9f504f845f8fa0f6c6cedf4cc4ca273ea3a01537
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: payload.email,
        password: payload.password,
      );
      return userAuthPayload.email;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        throw ('Wrong email or password');
      } else {
        throw (e.message.toString(),);
      }
    }
  }

  @override
<<<<<<< HEAD
  Future<void> signUp(UserAuthPayload payload) async {
=======
  Future<String> signUp(UserAuthPayload userAuthPayload) async {
>>>>>>> 9f504f845f8fa0f6c6cedf4cc4ca273ea3a01537
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: payload.email,
        password: payload.password,
      );
      return userAuthPayload.email;
    } on FirebaseAuthException catch (e) {
      throw (e.message.toString(),);
    }
  }
}
