import 'package:firebase_auth/firebase_auth.dart'
    show User, FirebaseAuth, FirebaseAuthException;
import 'package:flutter/material.dart';
import 'package:imove/helpers/handle_firebase_auth_exceptions.dart';
import 'package:imove/services/auth/auth_provider.dart';

class EmailPasswordAuth implements AuthProvider {
  @override
  Future<String?> createUser(String email, String password) async {
    try {
      final res = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      return res.user!.uid;
    } on FirebaseAuthException catch (e) {
      handleFirebaseAuthException(e);
      return null;
    }
  }

  @override
  Future<User?> getUser() async {
    try {
      return FirebaseAuth.instance.currentUser;
    } on FirebaseAuthException catch (e) {
      handleFirebaseAuthException(e);
      return null;
    }
  }

  @override
  Future<void> deleteUser() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      handleFirebaseAuthException(e);
    }
  }

  @override
  Future<void> login({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      handleFirebaseAuthException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> requestVerificationCode() async {
    try {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<bool> checkEmailVerified() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      await user?.reload();
      await Future.delayed(Durations.extralong4);
      return user?.emailVerified ?? false;
    } catch (e) {
      throw 'Error checking verification status: ${e.toString()}';
    }
  }

  @override
  Future<void> signout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw "Error signing out";
    }
  }
}
