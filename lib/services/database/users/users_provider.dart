import 'package:imove/models/user.dart';

abstract class UsersProvider {
  Future<void> createUser({required User user});
  Future<User> getUser(String id);
  Future<void> deleteUser(String id);
}
