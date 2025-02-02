import 'package:flutter/widgets.dart';
import 'package:imove/services/database/users/firestore_userdb.dart';

import 'package:uuid/uuid.dart';
import 'package:imove/models/delivery.dart';
import 'package:imove/services/auth/auth_service.dart';
import 'package:imove/services/database/deliveries/firestore_deliverydb.dart';
import 'package:imove/view_models/location_viewmodel.dart';
import 'package:imove/views/widgets/error_toast.dart';

abstract class BaseDeliveryViewModel extends ChangeNotifier {
  final LocationViewmodel locationViewModel;
  late List<TextEditingController> controllers;
  String? _category;
  String? _payer;
  double _fee = 2000;
  bool _isLoading = false;
  late String _rideId;

  BaseDeliveryViewModel({required this.locationViewModel}) {
    initialize();
  }

  String? get category => _category;
  String? get payer => _payer;
  String get rideId => _rideId;
  double get fee => _fee;
  bool get isLoading => _isLoading;

  set setCategory(String category) {
    _category = category;
    notifyListeners();
  }

  set setPayer(String payer) {
    _payer = payer;
    notifyListeners();
  }

  set changeLoadingState(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void initialize() {
    controllers = List.generate(
      5,
      (index) => TextEditingController(),
    );
  }

  bool checkFields() {
    if (_category == null ||
        _payer == null ||
        controllers.any((controller) => controller.text.isEmpty)) {
      errorToast("Enter all fields");
      return false;
    }
    return true;
  }

  Future<bool> placeOrder({required DateTime deliveryDate}) async {
    var uuid = Uuid();
    changeLoadingState = true;

    try {
      final currentUser = await AuthService.emailPassword().getUser();
      final userDetails = await FirestoreUserdb().getUser(currentUser!.uid);
      final id = uuid.v1();
      await FirestoreDeliverydb().createDelivery(
        delivery: DeliveryModel(
          id: id,
          price: _fee,
          orderStatus: OrderStatus.pending,
          dateTime: deliveryDate,
          senderAddress: controllers[0].text,
          senderId: currentUser.uid,
          senderName: userDetails.firstName,
          senderPhoneNumber: userDetails.phoneNumber.toString(),
          recieverAddress: controllers[1].text,
          receiverName: controllers[2].text,
          receiverNumber: controllers[3].text,
          quantity: int.tryParse(controllers[4].text) ?? 0,
          latLong: locationViewModel.location,
        ),
      );
      await FirestoreDeliverydb().sendDeliveryRequest(
        request: DeliveryModel(
          id: id,
          price: _fee,
          orderStatus: OrderStatus.pending,
          dateTime: deliveryDate,
          senderAddress: controllers[0].text,
          senderId: currentUser.uid,
          senderName: userDetails.firstName,
          senderPhoneNumber: userDetails.phoneNumber.toString(),
          recieverAddress: controllers[1].text,
          receiverName: controllers[2].text,
          receiverNumber: controllers[3].text,
          quantity: int.tryParse(controllers[4].text) ?? 0,
          latLong: locationViewModel.location,
        ),
      );
      _rideId = id;
      changeLoadingState = false;
      notifyListeners();
      return true;
    } catch (e) {
      errorToast("Could not place order");
      print(e);
      changeLoadingState = false;
      return false;
    }
  }
}
