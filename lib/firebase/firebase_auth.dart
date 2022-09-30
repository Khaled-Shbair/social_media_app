import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';

class AuthFirebase {
  static final _firebaseAuth = FirebaseAuth.instance;
  static final _fireStore = FirebaseFirestore.instance;

  static Future<void> register({
    required String email,
    required String name,
    required String password,
    required String phone,
  }) async {
    await _firebaseAuth
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then(
          (value) => _saveDataUser(
            email: email,
            name: name,
            phone: phone,
            id: value.user!.uid,
          ),
        );
  }

  static void _saveDataUser({
    required String email,
    required String name,
    required String phone,
    required String id,
  }) async {
    UserModel user = UserModel(
      id: id,
      name: name,
      email: email,
      phone: phone,
    );
    _fireStore.collection('users').doc(id).set(user.toMap());
  }

  static Future<void> login({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
