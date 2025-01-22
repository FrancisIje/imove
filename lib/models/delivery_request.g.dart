// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryRequest _$DeliveryRequestFromJson(Map<String, dynamic> json) =>
    DeliveryRequest(
      json['id'] as String,
      json['senderId'] as String,
      json['pickupAddresss'] as String,
      json['receiverAddress'] as String,
      DateTime.parse(json['dateCreated'] as String),
    );

Map<String, dynamic> _$DeliveryRequestToJson(DeliveryRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'pickupAddresss': instance.pickupAddresss,
      'receiverAddress': instance.receiverAddress,
      'dateCreated': instance.dateCreated.toIso8601String(),
    };
