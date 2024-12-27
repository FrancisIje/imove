import 'package:flutter/material.dart';
import 'package:imove/models/delivery.dart';
import 'package:imove/services/auth/auth_service.dart';
import 'package:imove/services/database/deliveries/firestore_deliverydb.dart';

class HistoryViewmodel extends ChangeNotifier {
  List<DeliveryModel>? _deliveries;

  List<DeliveryModel> get deliveries => _deliveries ?? [];

  void getDeliveries() async {
    final currentUser = await AuthService.emailPassword().getUser();
    _deliveries =
        await FirestoreDeliverydb().allUserDeliveries(id: currentUser!.uid);

    notifyListeners();
  }
}
