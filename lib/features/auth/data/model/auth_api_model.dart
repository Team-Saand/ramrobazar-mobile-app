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
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? gender;
  final String? dateOfBirth;
  final String? address;
  final String? phoneNumber;
  final String? userPhoto;

  AuthApiModel({
    this.firstName,
    this.middleName,
    this.lastName,
    this.gender,
    this.dateOfBirth,
    this.address,
    this.phoneNumber,
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
        firstName = '',
        middleName = '',
        lastName = '',
        gender = '',
        dateOfBirth = '',
        address = '',
        phoneNumber = '',
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
        firstName: firstName,
        middleName: middleName,
        lastName: lastName,
        gender: gender,
        dateOfBirth: dateOfBirth,
        address: address,
        phoneNumber: phoneNumber,
        userPhoto: userPhoto,
      );

  UserEntity toUserEntity(AuthApiModel model) => model.toEntity();

  @override
  String toString() {
    return 'AuthApiModel(id: $id, userName: $userName, password: $password, email: $email, firstName: $firstName, middleName: $middleName, lastName: $lastName, gender : $gender, dateOfBirth: $dateOfBirth, address: $address, phoneNumber: $phoneNumber, userPhoto: $userPhoto)';
  }
}
