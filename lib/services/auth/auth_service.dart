import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:imove/services/auth/auth_provider.dart';
import 'package:imove/services/auth/email_password_auth.dart';

class AuthService implements AuthProvider {
  final AuthProvider authProvider;
  AuthService(this.authProvider);

  factory AuthService.emailPassword() => AuthService(EmailPasswordAuth());

  @override
  Future<String?> createUser(String email, String password) {
    // TODO: implement createUser
    return authProvider.createUser(email, password);
  }

  @override
  Future<void> deleteUser() {
    // TODO: implement deleteUser
    return authProvider.deleteUser();
  }

  @override
  Future<User?> getUser() {
    // TODO: implement getUser
    return authProvider.getUser();
  }

  @override
  Future<void> login({required String email, required String password}) {
    return authProvider.login(email: email, password: password);
  }

  @override
  Future<void> signout() {
    return authProvider.signout();
  }
}
