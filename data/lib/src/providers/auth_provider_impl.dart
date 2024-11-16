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
  Future<String> signIn(UserAuthPayload userAuthPayload) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userAuthPayload.email,
        password: userAuthPayload.password,
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
  Future<String> signUp(UserAuthPayload userAuthPayload) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userAuthPayload.email,
        password: userAuthPayload.password,
      );
      return userAuthPayload.email;
    } on FirebaseAuthException catch (e) {
      throw (e.message.toString(),);
    }
  }
}
