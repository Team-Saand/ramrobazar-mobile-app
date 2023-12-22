import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/provider/internet_connectivity.dart';
import '../../../../core/failure/failure.dart';
import '../../data/repository/listing_remote_repository.dart';
import '../entity/listing_entity.dart';

final listingRepositoryProvider = Provider<IListingRepository>((ref) {
  final internetStatus = ref.watch(connectivityStatusProvider);

  if (internetStatus == ConnectivityStatus.isConnected) {
    return ref.watch(listingRemoteRepositoryProvider);
  } else {
    return ref.watch(listingRemoteRepositoryProvider);
  }
});

abstract class IListingRepository {
  Future<Either<Failure, List<ListingEntity>>> getAllListing();
  Future<Either<Failure, Map<String, dynamic>>> getSingleListing(String id);
  Future<Either<Failure, bool>> deleteListing(String id);
  Future<Either<Failure, bool>> updateListing(ListingEntity listing);
  Future<Either<Failure, bool>> addListing(ListingEntity listing);
}
