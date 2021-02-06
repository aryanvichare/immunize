import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges();
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _firebaseAuth.currentUser;
  }

  Future<User> createUserWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _firebaseAuth.currentUser;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
