import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@immutable
class AppUser {
  final String uid;
  final String email;
  final String name;
  final String avatar;
  final bool registered;

  const AppUser({
    @required this.uid,
    this.name,
    @required this.email,
    this.avatar,
    this.registered
  });
}

class FirebaseAuthService {
  final CollectionReference users = FirebaseFirestore.instance.collection('users');
  final _firebaseAuth = FirebaseAuth.instance;

  Future<AppUser> _userFromFirebase(User fbUser) async {
    if (fbUser == null) {
      return null;
    }

    DocumentSnapshot fsUser = await users.doc(fbUser.email).get();

    if (fsUser == null || fsUser.data() == null) {
      return AppUser(uid: fbUser.uid, email: fbUser.email);
    }
    
    return AppUser(
      uid: fbUser.uid, 
      email: fbUser.email,
      name: fsUser.data()['name'],
      avatar: fsUser.data()['avatar'],
      registered: fsUser.data()['registered']
      );
  }

  Future<AppUser> _createDbUser(User fbUser, String name) async {
    return await users.doc(fbUser.email).set({ 'name': name, 'uid': fbUser.uid }).then((res) => AppUser(uid: fbUser.uid, email: fbUser.email, name: name));
  }

  Stream<AppUser> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges().asyncMap((event) => _userFromFirebase(event));
  }

  Future<AppUser> signInWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromFirebase(_firebaseAuth.currentUser);
  }

  Future<AppUser> createUserWithEmailAndPassword(String email, String password, String name) async {
    final result =  await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _createDbUser(result.user, name);
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
