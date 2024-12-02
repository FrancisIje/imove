import 'package:flutter/material.dart';
import 'package:imove/models/user.dart';

class UserViewmodel extends ChangeNotifier {
  User? _user;

  User get user =>
      _user ??
      User(
          id: "00000000",
          firstName: "Francis",
          lastName: "Ijenebe",
          email: "ijenebefrancis@gmail.com",
          phoneNumber: 08104204245);

  void setUser() async {
    final user = await Future.delayed(Durations.extralong2).then(
      (value) => User(
          id: "id",
          firstName: "firstName",
          lastName: "lastName",
          email: "email",
          phoneNumber: 08023242323),
    );
    _user = user;
    print(_user);
    notifyListeners();
  }
}
