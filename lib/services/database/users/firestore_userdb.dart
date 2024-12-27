import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:imove/services/database/users/users_provider.dart';

import 'package:imove/models/user.dart';
import 'package:imove/views/widgets/error_toast.dart';

class FirestoreUserdb implements UsersProvider {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  @override
  Future<void> createUser({required User user}) async {
    try {
      await _usersCollection.doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      errorToast(e.message.toString());
      throw Exception('Failed to create user');
    }
  }

  @override
  Future<void> deleteUser(String id) async {
    try {
      await _usersCollection.doc(id).delete();
    } on FirebaseException catch (e) {
      errorToast(e.message.toString());
      throw Exception('Failed to delete user');
    }
  }

  @override
  Future<User> getUser(String id) async {
    try {
      final DocumentSnapshot doc = await _usersCollection.doc(id).get();
      if (doc.exists) {
        return User.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception('User not found');
      }
    } on FirebaseException catch (e) {
      errorToast(e.message.toString());
      throw Exception('Failed to get user');
    }
  }
}
