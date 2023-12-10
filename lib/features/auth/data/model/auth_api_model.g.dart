// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthApiModel _$AuthApiModelFromJson(Map<String, dynamic> json) => AuthApiModel(
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      gender: json['gender'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      userPhoto: json['userPhoto'] as String?,
      password: json['password'] as String?,
      id: json['id'] as String?,
      userName: json['userName'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$AuthApiModelToJson(AuthApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'password': instance.password,
      'email': instance.email,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'userPhoto': instance.userPhoto,
    };
