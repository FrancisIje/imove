import 'package:imove/models/latlong.dart';
import 'package:json_annotation/json_annotation.dart';

part "delivery.g.dart";

enum OrderStatus { completed, pending, failed }

@JsonSerializable()
class DeliveryModel {
  final String id;
  final double price;
  final OrderStatus orderStatus;
  final DateTime dateTime;
  final String senderAddress;
  final String senderId;
  final String senderName;
  final String senderPhoneNumber;
  final String recieverAddress;
  final String receiverName;
  final String receiverNumber;
  @LatLongConverter()
  final LatLong latLong;
  final int quantity;

  DeliveryModel(
      {required this.id,
      required this.price,
      required this.orderStatus,
      required this.dateTime,
      required this.senderAddress,
      required this.senderId,
      required this.senderName,
      required this.senderPhoneNumber,
      required this.recieverAddress,
      required this.receiverName,
      required this.receiverNumber,
      required this.quantity,
      required this.latLong});

  factory DeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryModelToJson(this);
}

class LatLongConverter implements JsonConverter<LatLong, Map<String, dynamic>> {
  const LatLongConverter();

  @override
  LatLong fromJson(Map<String, dynamic> json) {
    return LatLong.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(LatLong object) {
    return object.toJson();
  }
}
