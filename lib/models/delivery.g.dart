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
      recieverId: json['recieverId'] as String,
      receiverName: json['receiverName'] as String,
      latLong: LatLong.fromJson(json['latLong'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeliveryModelToJson(DeliveryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'orderStatus': _$OrderStatusEnumMap[instance.orderStatus]!,
      'dateTime': instance.dateTime.toIso8601String(),
      'recieverId': instance.recieverId,
      'receiverName': instance.receiverName,
      'latLong': instance.latLong,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.completed: 'completed',
  OrderStatus.pending: 'pending',
  OrderStatus.failed: 'failed',
};
