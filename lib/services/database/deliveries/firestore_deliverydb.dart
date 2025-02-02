import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:imove/models/delivery.dart';

import 'package:imove/services/database/deliveries/deliveries_provider.dart';
import 'package:imove/views/widgets/error_toast.dart';

class FirestoreDeliverydb implements DeliveriesProvider {
  FirebaseFirestore firebaseInstance = FirebaseFirestore.instance;
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

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> getAcceptedRequest(
      {required String userId, required String rideId}) async* {
    // await firebaseInstance.terminate();
    // await firebaseInstance.clearPersistence();
    print(rideId);
    yield* firebaseInstance
        .collection('accepted_request')
        .doc(rideId)
        .snapshots();
  }

  @override
  Future<void> sendDeliveryRequest({required DeliveryModel request}) async {
    try {
      await firebaseInstance
          .collection("delivery_requests")
          .doc(request.id)
          .set(request.toJson());
    } on FirebaseException catch (e) {
      log(e.toString());
    }
  }

  Future<void> sendFcmNotification(String deviceToken) async {
    await dotenv.load();
    final String? bearerToken = dotenv.env['BEARER_TOKEN']; // Load from env

    if (bearerToken == null || bearerToken.isEmpty) {
      throw Exception("Bearer token is not set in environment variables.");
    }

    const String url =
        "https://fcm.googleapis.com/v1/projects/imove-cc91c/messages:send";

    final Map<String, dynamic> body = {
      "message": {
        "token": deviceToken,
        "notification": {
          "title": "FCM Message",
          "body": "This is an FCM notification message!"
        }
      }
    };

    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $bearerToken",
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print("Notification sent successfully!");
    } else {
      print("Failed to send notification: ${response.body}");
    }
  }
}
