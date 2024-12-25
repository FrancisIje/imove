import 'package:flutter/material.dart';
import 'package:imove/models/delivery.dart';
import 'package:imove/models/latlong.dart';

class HistoryViewmodel extends ChangeNotifier {
  List<DeliveryModel>? _deliveries;

  List<DeliveryModel> get deliveries => _deliveries ?? [];

  void getDeliveries() async {
    print('hii');
    _deliveries = await Future.delayed(Duration(seconds: 3)).then(
      (value) => [
        DeliveryModel(
            id: "ORDR0000",
            price: 3000,
            orderStatus: OrderStatus.completed,
            dateTime: DateTime(2000),
            recieverId: "asdf",
            receiverName: "John Doe",
            latLong: LatLong(lat: 0.1, long: 0.2)),
        DeliveryModel(
            id: "ORDR1111",
            price: 2300,
            orderStatus: OrderStatus.completed,
            dateTime: DateTime(2023),
            recieverId: "asdfsds",
            receiverName: "John Doe",
            latLong: LatLong(lat: 0.2, long: 0.2)),
        DeliveryModel(
            id: "ORDR2323",
            price: 2300,
            orderStatus: OrderStatus.completed,
            dateTime: DateTime(2023),
            recieverId: "asdfsds",
            receiverName: "John Doe",
            latLong: LatLong(lat: 0.2, long: 0.2)),
        DeliveryModel(
            id: "ORDR9303",
            price: 2300,
            orderStatus: OrderStatus.completed,
            dateTime: DateTime(2023),
            recieverId: "asdfsds",
            receiverName: "John Doe",
            latLong: LatLong(lat: 0.2, long: 0.2)),
        DeliveryModel(
            id: "ORDR37830",
            price: 2300,
            orderStatus: OrderStatus.completed,
            dateTime: DateTime(2023),
            recieverId: "asdfsds",
            receiverName: "John Doe",
            latLong: LatLong(lat: 0.2, long: 0.2)),
      ],
    );

    notifyListeners();
  }
}
