import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_prefs/user_shared_prefs.dart';
import '../../domain/entity/user_entity.dart';
import '../model/auth_api_model.dart';

final authRemoteDataSourceProvider = Provider((ref) => AuthRemoteDataSource(
      dio: ref.read(httpServiceProvider),
      userSharedPrefs: ref.read(userSharedPrefsProvider),
      authApiModel: ref.read(authApiModelProvider),
    ));

class AuthRemoteDataSource {
  final Dio dio;
  final AuthApiModel authApiModel;
  final UserSharedPrefs userSharedPrefs;

  AuthRemoteDataSource({
    required this.dio,
    required this.userSharedPrefs,
    required this.authApiModel,
  });

  Future<Either<Failure, bool>> registerUser(UserEntity user) async {
    try {
      Map<String, String?> data;
      if (user.firstName != null) {
        data = {
          "userName": user.userName,
          "password": user.password,
        };
      } else {
        data = {
          "userName": user.userName,
          "password": user.password,
        };
      }
      Response response = await dio.post(ApiEndpoints.register, data: data);

      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["error"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      if (e.response == null) {
        return Left(
          Failure(
            error: 'No response from server',
            statusCode: '400',
          ),
        );
      } else {
        return Left(
          Failure(
            error: e.response!.data['error'] ?? 'No response from server',
            statusCode: e.response?.statusCode.toString() ?? '400',
          ),
        );
      }
    }
  }

  Future<Either<Failure, bool>> loginUser(
    String userName,
    String password,
  ) async {
    try {
      Response response = await dio.post(
        ApiEndpoints.login,
        data: {
          "userName": userName,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        await userSharedPrefs.deleteUserToken();

        String token = response.data["token"];
        await userSharedPrefs.setUserToken(token);
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["error"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      if (e.response == null) {
        return Left(
          Failure(
            error: 'No response from server',
            statusCode: '400',
          ),
        );
      } else {
        return Left(
          Failure(
            error: e.response!.data['error'] ?? 'No response from server',
            statusCode: e.response?.statusCode.toString() ?? '400',
          ),
        );
      }
    }
  }
}
