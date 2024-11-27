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
  final String recieverId;
  final String receiverName;
  final LatLong latLong;

  DeliveryModel(
      {required this.id,
      required this.price,
      required this.orderStatus,
      required this.dateTime,
      required this.recieverId,
      required this.receiverName,
      required this.latLong});

  factory DeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryModelToJson(this);
}
