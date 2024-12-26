import 'package:firebase_auth/firebase_auth.dart';

void handleFirebaseAuthException(FirebaseAuthException e) {
  switch (e.code) {
    case 'invalid-email':
      throw 'The email address is badly formatted.';

    case 'user-disabled':
      throw 'The user account has been disabled by an administrator.';

    case 'user-not-found':
      throw 'No user found for the given email address.';

    case 'wrong-password':
      throw 'The password is invalid for the given email address.';

    case 'email-already-in-use':
      throw 'The email address is already in use by another account.';

    case 'weak-password':
      throw 'The password is too weak.';

    case 'too-many-requests':
      throw 'We have blocked all requests from this device due to unusual activity. Try again later.';

    case 'operation-not-allowed':
      throw 'Email/password accounts are not enabled. Enable them in the Firebase console.';

    default:
      throw 'An undefined Error occurred: ${e.message}';
  }
}
