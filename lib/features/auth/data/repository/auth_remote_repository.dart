import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_remote_data_source.dart';

final authRemoteRepositoryProvider =
    Provider<IAuthRepository>((ref) {
  return AuthRemoteRepositoryImpl(ref.read(authRemoteDataSourceProvider));
});

class AuthRemoteRepositoryImpl implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRemoteRepositoryImpl(this._authRemoteDataSource);

  @override
  Future<Either<Failure, bool>> loginUser(
      String username, String password) async {
    return await _authRemoteDataSource.loginUser(username, password);
  }

  @override
  Future<Either<Failure, bool>> registerUser(UserEntity user) async {
    return await _authRemoteDataSource.registerUser(user);
  }
}
