import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/provider/internet_connectivity.dart';
import '../../../../core/failure/failure.dart';
import '../../data/repository/auth_remote_repository.dart';
import '../entity/user_entity.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  final internetStatus = ref.watch(connectivityStatusProvider);

  if (internetStatus == ConnectivityStatus.isConnected) {
    return ref.watch(authRemoteRepositoryProvider);
  }
  // Won't be implementing local repository for now. So,
  return ref.watch(authRemoteRepositoryProvider);
});

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerUser(UserEntity user);
  Future<Either<Failure, bool>> loginUser(String phone, String password);
}
