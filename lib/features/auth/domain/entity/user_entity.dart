import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? userName;
  final String? password;
  final String? email;
  final String? first_name;
  final String? middle_name;
  final String? last_name;
  final String? gender;
  final String? dateOfBirth;
  final String? address;
  final String? phone;
  final String? userPhoto;

  const UserEntity(
      {this.id,
      this.userName,
      this.password,
      this.email,
      this.first_name,
      this.middle_name,
      this.last_name,
      this.gender,
      this.dateOfBirth,
      this.address,
      this.phone,
      this.userPhoto});

  @override
  List<Object?> get props => [
        userName,
        password,
        email,
        first_name,
        middle_name,
        last_name,
        gender,
        dateOfBirth,
        address,
        phone
      ];

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        id: json["id"],
        userName: json["userName"],
        password: json["password"],
        email: json["email"],
        first_name: json["first_name"],
        middle_name: json["middle_name"],
        last_name: json["last_name"],
        gender: json["gender"],
        dateOfBirth: json["dateOfBirth"],
        address: json["address"],
        phone: json["phone"],
        userPhoto: json['userPhoto'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "password": password,
        'email': email,
        "first_name": first_name,
        "middle_name": middle_name,
        "last_name": last_name,
        "gender": gender,
        "dateOfBirth": dateOfBirth,
        "address": address,
        "phone": phone,
        "userPhoto": userPhoto
      };
}
