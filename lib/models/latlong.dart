import 'package:json_annotation/json_annotation.dart';

part 'latlong.g.dart';

@JsonSerializable()
class LatLong {
  final double lat;
  final double long;

  LatLong({
    required this.lat,
    required this.long,
  });

  factory LatLong.fromJson(Map<String, dynamic> json) =>
      _$LatLongFromJson(json);

  Map<String, dynamic> toJson() => _$LatLongToJson(this);
}
