import 'dart:async';

import 'package:flutter/material.dart';
import 'package:imove/services/auth/email_password_auth.dart';
import 'package:imove/views/widgets/error_toast.dart';

class VerificationViewmodel extends ChangeNotifier {
  late List<FocusNode> focusNodes;

  late List<TextEditingController> controllers;

  late int _secondsTime;

  int get secondsTime => _secondsTime;

  void initialize() {
    controllers = List.generate(
      4,
      (index) => TextEditingController(),
    );
    focusNodes = List.generate(
      4,
      (index) => FocusNode(),
    );
    startCountdown();
  }

  void startCountdown() {
    _secondsTime = 45;
    print("countdown started");
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsTime > 0) {
        _secondsTime--;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }

  Future<bool> confirmVerification() async {
    try {
      final isVerified = await EmailPasswordAuth().checkEmailVerified();
      if (isVerified == false) {
        errorToast("User is not verified");
      }
      return isVerified;
    } catch (e) {
      errorToast("Unable to confirm verification");
      return false;
    }
  }

  requestOtp() {
    EmailPasswordAuth().requestVerificationCode();
    startCountdown();
  }

  @override
  void dispose() {
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  VerificationViewmodel() {
    initialize();
  }
}
