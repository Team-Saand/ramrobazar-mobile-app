import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? userName;
  final String? password;
  final String? email;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? gender;
  final String? dateOfBirth;
  final String? address;
  final String? phoneNumber;
  final String? userPhoto;

  const UserEntity(
      {this.id,
      this.userName,
      this.password,
      this.email,
      this.firstName,
      this.middleName,
      this.lastName,
      this.gender,
      this.dateOfBirth,
      this.address,
      this.phoneNumber,
      this.userPhoto});

  @override
  List<Object?> get props => [
        userName,
        password,
        email,
        firstName,
        middleName,
        lastName,
        gender,
        dateOfBirth,
        address,
        phoneNumber
      ];

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        id: json["id"],
        userName: json["userName"],
        password: json["password"],
        email: json["email"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        gender: json["gender"],
        dateOfBirth: json["dateOfBirth"],
        address: json["address"],
        phoneNumber: json["phoneNumber"],
        userPhoto: json['userPhoto'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "password": password,
        'email': email,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "gender": gender,
        "dateOfBirth": dateOfBirth,
        "address": address,
        "phoneNumber": phoneNumber,
        "userPhoto": userPhoto
      };
}
