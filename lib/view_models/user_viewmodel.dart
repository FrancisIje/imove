import 'package:flutter/material.dart';
import 'package:imove/models/user.dart';
import 'package:imove/services/auth/auth_service.dart';
import 'package:imove/services/database/users/firestore_userdb.dart';

class UserViewmodel extends ChangeNotifier {
  User? _user;

  User get user =>
      _user ??
      User(id: "", firstName: "", lastName: "", email: "", phoneNumber: 0);

  void setUser() async {
    final authUser = await AuthService.emailPassword().getUser();

    final user = await FirestoreUserdb().getUser(authUser!.uid);
    _user = user;
    print(_user);
    notifyListeners();
  }
}
