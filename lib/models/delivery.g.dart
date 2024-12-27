// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryModel _$DeliveryModelFromJson(Map<String, dynamic> json) =>
    DeliveryModel(
      id: json['id'] as String,
      price: (json['price'] as num).toDouble(),
      orderStatus: $enumDecode(_$OrderStatusEnumMap, json['orderStatus']),
      dateTime: DateTime.parse(json['dateTime'] as String),
      senderAddress: json['senderAddress'] as String,
      senderId: json['senderId'] as String,
      recieverAddress: json['recieverAddress'] as String,
      receiverName: json['receiverName'] as String,
      receiverNumber: json['receiverNumber'] as String,
      quantity: (json['quantity'] as num).toInt(),
      latLong: const LatLongConverter()
          .fromJson(json['latLong'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeliveryModelToJson(DeliveryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'orderStatus': _$OrderStatusEnumMap[instance.orderStatus]!,
      'dateTime': instance.dateTime.toIso8601String(),
      'senderAddress': instance.senderAddress,
      'senderId': instance.senderId,
      'recieverAddress': instance.recieverAddress,
      'receiverName': instance.receiverName,
      'receiverNumber': instance.receiverNumber,
      'latLong': const LatLongConverter().toJson(instance.latLong),
      'quantity': instance.quantity,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.completed: 'completed',
  OrderStatus.pending: 'pending',
  OrderStatus.failed: 'failed',
};
