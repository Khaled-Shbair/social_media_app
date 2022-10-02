import '../shared_preferences/pref_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../GetX/profile_getX.dart';
import 'response_firebase.dart';

class AuthFirebase {
  static final _firebaseAuth = FirebaseAuth.instance;

  static Future<FbResponse> register({
    required String password,
    required String email,
    required String phone,
    required String name,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        password: password,
        email: email,
      );
      if (userCredential.user != null) {
        ProfileGetX.to.setDataUser(
          image:
              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
          cover:
              'https://img.freepik.com/free-photo/red-haired-serious-young-man-blogger-looks-confidently_273609-16730.jpg?w=740&t=st=1664705051~exp=1664705651~hmac=5108c75d5c667e66adf84e10e4ee26fdb284c0d923a19cde765253948d9099db',
          id: userCredential.user!.uid,
          isEmailVerified: false,
          email: email,
          phone: phone,
          bio: 'write your bio ...',
          name: name,
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

  static Future<FbResponse> login({
    required String password,
    required String email,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        password: password,
        email: email,
      );
      if (userCredential.user != null) {
        // String message = userCredential.user!.emailVerified
        //     ? 'Logged in successfully'
        //     : 'You must verify your email!';
        // return FbResponse(message: message, status: userCredential.user!.emailVerified);
        PrefController.saveLogin();
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
