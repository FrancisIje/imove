import 'package:flutter/material.dart';
import 'package:imove/services/auth/auth_service.dart';
import 'package:imove/views/widgets/error_toast.dart';

class LoginViewmodel extends ChangeNotifier {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void initialize() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  Future<bool> login() async {
    if (!_validateInputs()) return false;

    try {
      _setLoading(true);

      await AuthService.emailPassword().login(
          email: emailController.text.trim(),
          password: passwordController.text);

      return true;
    } catch (error) {
      _handleError(error);
      return false;
    } finally {
      _setLoading(false);
    }
  }

  bool _validateInputs() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      errorToast("Please enter both email and password");
      return false;
    }
    return true;
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _handleError(dynamic error) {
    final message = error is String ? error : error.toString();
    errorToast(message);
    print('Login error: $message');
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  LoginViewmodel() {
    initialize();
  }
}
