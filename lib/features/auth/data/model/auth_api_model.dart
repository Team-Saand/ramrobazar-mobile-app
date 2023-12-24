import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/user_entity.dart';

part 'auth_api_model.g.dart';

final authApiModelProvider = Provider<AuthApiModel>(
  (ref) => AuthApiModel.empty(),
);

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: 'id')
  final String? id;
  final String userName;
  final String? password;
  final String email;
  final String? first_name;
  final String? middle_name;
  final String? last_name;
  final String? gender;
  final String? dateOfBirth;
  final String? address;
  final String? phone;
  final String? userPhoto;

  AuthApiModel({
    this.first_name,
    this.middle_name,
    this.last_name,
    this.gender,
    this.dateOfBirth,
    this.address,
    this.phone,
    this.userPhoto,
    this.password,
    this.id,
    required this.userName,
    required this.email,
  });

  AuthApiModel.empty()
      : id = '',
        userName = '',
        password = '',
        email = '',
        first_name = '',
        middle_name = '',
        last_name = '',
        gender = '',
        dateOfBirth = '',
        address = '',
        phone = '',
        userPhoto = '';

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // Convert Hive Object to Entity
  UserEntity toEntity() => UserEntity(
        id: id,
        userName: userName,
        password: password,
        email: email,
        first_name: first_name,
        middle_name: middle_name,
        last_name: last_name,
        gender: gender,
        dateOfBirth: dateOfBirth,
        address: address,
        phone: phone,
        userPhoto: userPhoto,
      );

  UserEntity toUserEntity(AuthApiModel model) => model.toEntity();

  @override
  String toString() {
    return 'AuthApiModel(id: $id, userName: $userName, password: $password, email: $email, first_name: $first_name, middle_name: $middle_name, last_name: $last_name, gender : $gender, dateOfBirth: $dateOfBirth, address: $address, phone: $phone, userPhoto: $userPhoto)';
  }
}
