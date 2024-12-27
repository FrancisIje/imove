import "package:firebase_auth/firebase_auth.dart";

abstract class AuthProvider {
  Future<User?> getUser();
  Future<String?> createUser(String email, String password);
  Future<void> deleteUser();
  Future<void> login({required String email, required String password});
  Future<void> signout();
}
