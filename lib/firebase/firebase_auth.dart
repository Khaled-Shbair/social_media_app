import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';
import 'response_firebase.dart';

class AuthFirebase {
  static final _firebaseAuth = FirebaseAuth.instance;
  static final _fireStore = FirebaseFirestore.instance;

  static Future<FbResponse> register({
    required String email,
    required String name,
    required String password,
    required String phone,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        _saveDataUser(
          email: email,
          name: name,
          phone: phone,
          isEmailVerified: false,
          id: userCredential.user!.uid,
        );
        await userCredential.user!.sendEmailVerification();
        return FbResponse(
          message:
              'Account created successfully, check your email & verify account',
          status: true,
        );
      }
    } on FirebaseAuthException catch (e) {
      return _controlFirebaseException(e);
    } catch (e) {
      return FbResponse(message: e.toString(), status: false);
    }
    return FbResponse(
        message: 'Something went wrong, try again', status: false);
  }

  static void _saveDataUser({
    required String email,
    required String name,
    required String phone,
    required String id,
    required bool isEmailVerified,
  }) async {
    UserModel user = UserModel(
      id: id,
      name: name,
      email: email,
      phone: phone,
      isEmailVerified: isEmailVerified,
    );
    _fireStore.collection('users').doc(id).set(user.toMap());
  }

  static Future<FbResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        // String message = userCredential.user!.emailVerified
        //     ? 'Logged in successfully'
        //     : 'You must verify your email!';
        // return FbResponse(message: message, status: userCredential.user!.emailVerified);
        return FbResponse(message: 'Logged in successfully', status: true);
      }
    } on FirebaseAuthException catch (e) {
      return _controlFirebaseException(e);
    } catch (e) {
      return FbResponse(message: e.toString(), status: false);
    }
    return FbResponse(
        message: 'Something went wrong, try again', status: false);
  }

  static FbResponse _controlFirebaseException(FirebaseAuthException exception) {
    switch (exception.code) {
      case 'invalid-email':
        return FbResponse(message: 'Invalid email', status: false);
      case 'weak-password':
        return FbResponse(message: 'Weak password', status: false);
      case 'user-disabled':
        return FbResponse(message: 'User disabled', status: false);
      case 'user-not-found':
        return FbResponse(message: 'User not found', status: false);
      case 'wrong-password':
        return FbResponse(message: 'Wrong password', status: false);
      case 'auth/invalid-email':
        return FbResponse(message: 'Auth/Invalid email', status: false);
      case 'auth/user-not-found':
        return FbResponse(message: 'Auth/User not found', status: false);
      case 'email-already-in-use':
        return FbResponse(message: 'Email already in use', status: false);
      case 'operation-not-allowed':
        return FbResponse(message: 'Operation not allowed', status: false);
      default:
        return FbResponse(
            message: exception.message ?? 'Error occurred', status: false);
    }
  }
}
