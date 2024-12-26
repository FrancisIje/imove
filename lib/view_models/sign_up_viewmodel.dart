import 'package:flutter/material.dart';
import 'package:imove/models/user.dart';
import 'package:imove/services/auth/auth_service.dart';
import 'package:imove/services/auth/email_password_auth.dart';
import 'package:imove/services/database/users/firestore_userdb.dart';

import 'package:imove/views/widgets/error_toast.dart';

class SignUpViewmodel extends ChangeNotifier {
  List<TextEditingController> controllers = [];

  List<FocusNode> focusNodes = [];

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  initialize() {
    controllers = List.generate(5, (_) => TextEditingController());
    focusNodes = List.generate(5, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var i = 0; i < controllers.length; i++) {
      controllers[i].dispose();
    }
    for (var i = 0; i < focusNodes.length; i++) {
      focusNodes[i].dispose();
    }

    super.dispose();
  }

  Future<bool> handleSignUp() async {
    try {
      _isLoading = true;
      notifyListeners();

      final firstName = controllers[0].text;
      final lastName = controllers[1].text;
      final phoneNumber = int.parse(controllers[2].text);
      final email = controllers[3].text;
      final password = controllers[4].text;

      final id = await AuthService.emailPassword().createUser(email, password);
      await FirestoreUserdb().createUser(
          user: User(
              id: id!,
              firstName: firstName,
              lastName: lastName,
              email: email,
              phoneNumber: phoneNumber));
      requestOtp();
      return true;
    } catch (error) {
      errorToast(error.toString());
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  requestOtp() {
    EmailPasswordAuth().requestVerificationCode();
  }

  SignUpViewmodel() {
    initialize();
  }
}
