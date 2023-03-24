import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  AuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<Object?> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return IdTokenResult;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<Object?> signUp(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return UserInfo;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
