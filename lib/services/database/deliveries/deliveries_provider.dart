import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:imove/models/delivery.dart';

abstract class DeliveriesProvider {
  Future<List<DeliveryModel>> allUserDeliveries({required String id});
  Future<void> createDelivery({required DeliveryModel delivery});

  Future<void> sendDeliveryRequest({required DeliveryModel request});
  Stream<DocumentSnapshot<Map<String, dynamic>>> getAcceptedRequest(
      {required String userId, required String rideId});
}
