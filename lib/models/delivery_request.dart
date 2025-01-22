import 'package:json_annotation/json_annotation.dart';

part 'delivery_request.g.dart';

@JsonSerializable()
class DeliveryRequest {
  final String id;
  final String senderId;
  final String pickupAddresss;
  final String receiverAddress;
  final DateTime dateCreated;

  DeliveryRequest(this.id, this.senderId, this.pickupAddresss,
      this.receiverAddress, this.dateCreated);

  factory DeliveryRequest.fromJson(Map<String, dynamic> json) =>
      _$DeliveryRequestFromJson(json);

  toJson() => _$DeliveryRequestToJson(this);
}
