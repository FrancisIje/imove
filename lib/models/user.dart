import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final int phoneNumber;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
