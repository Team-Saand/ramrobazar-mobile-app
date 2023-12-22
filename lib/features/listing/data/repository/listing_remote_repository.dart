import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/listing_entity.dart';
import '../../domain/repository/listing_repository.dart';
import '../data_source/listing_remote_data_source.dart';

final listingRemoteRepositoryProvider = Provider<IListingRepository>((ref) {
  return AdRemoteRepositoryImpl(ref.read(listingRemoteDataSourceProvider));
});

class AdRemoteRepositoryImpl implements IListingRepository {
  final AdRemoteDataSource _listingRemoteDataSource;

  AdRemoteRepositoryImpl(this._listingRemoteDataSource);

  @override
  Future<Either<Failure, bool>> updateListing(ListingEntity listing) async {
    return await _listingRemoteDataSource.updateListing(listing);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getSingleListing(
      String id) async {
    return await _listingRemoteDataSource.getSingleListing(id);
  }

  @override
  Future<Either<Failure, List<ListingEntity>>> getAllListing() async {
    return _listingRemoteDataSource.getAllListing();
  }

  @override
  Future<Either<Failure, bool>> deleteListing(String id) {
    return _listingRemoteDataSource.deleteListing(id);
  }

  @override
  Future<Either<Failure, bool>> addListing(ListingEntity listing) {
    return _listingRemoteDataSource.addListing(listing);
  }
}
