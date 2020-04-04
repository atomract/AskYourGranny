import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

@immutable
class User {
  const User({@required this.uid, this.email});
  final String uid;
  final String email;
}

class FirebaseAuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    return user == null ? null : User(uid: user.uid, email: user.email);
  }

  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
  }

  Future<FirebaseUser> getUser() {
    return _firebaseAuth.currentUser();
  }

  Future<User> signInWithEmailAndPassword(
      {@required String email, @required String password}) async {
    try {
      final authResult = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(authResult.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<User> createUserWithEmailAndPassword(
      {@required String email, @required String password}) async {
    try {
      final authResult = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(authResult.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
