import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:imove/models/delivery.dart';
import 'package:imove/services/database/deliveries/deliveries_provider.dart';
import 'package:imove/views/widgets/error_toast.dart';

class FirestoreDeliverydb implements DeliveriesProvider {
  final CollectionReference _deliveriesCollection =
      FirebaseFirestore.instance.collection('deliveries');

  @override
  Future<List<DeliveryModel>> allUserDeliveries({required String id}) async {
    try {
      final querySnapshot =
          await _deliveriesCollection.doc(id).collection('deliveries').get();

      final deliveries = querySnapshot.docs
          .map((doc) => DeliveryModel.fromJson(doc.data()))
          .toList();

      return deliveries;
    } on FirebaseException catch (e) {
      errorToast(e.message.toString());
      throw Exception('Failed to get deliveries');
    }
  }

  @override
  Future<void> createDelivery({required DeliveryModel delivery}) async {
    try {
      // Using add() instead of set() to generate a unique ID for each delivery
      await _deliveriesCollection
          .doc(delivery.senderId)
          .collection('deliveries') // Create a subcollection for deliveries
          .add(delivery.toJson()); // add() generates a unique document ID
    } on FirebaseException catch (e) {
      errorToast(e.message.toString());
      throw Exception('Failed to create delivery');
    }
  }
}
