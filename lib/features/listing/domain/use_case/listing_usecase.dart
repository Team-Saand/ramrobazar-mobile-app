import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../entity/listing_entity.dart';
import '../repository/listing_repository.dart';


final listingUseCaseProvider = Provider<AdUseCase>(
  (ref) => AdUseCase(
    listingRepository: ref.watch(listingRepositoryProvider),
  ),
);

class AdUseCase {
  final IListingRepository listingRepository;

  AdUseCase({ required this.listingRepository});

  Future<Either<Failure, bool>> addListing(ListingEntity listing) async {
    return await listingRepository.addListing(listing);
  }

  Future<Either<Failure, bool>> updateListing(
      ListingEntity listing) async {
    return await listingRepository.updateListing(listing);
  }

  Future<Either<Failure, List<ListingEntity>>> getAllListing() {
    return listingRepository.getAllListing();
  }
    Future<Either<Failure, Map<String, dynamic>>> getSingleListing(String id) {
    return listingRepository.getSingleListing(id);
  }

  Future<Either<Failure, bool>> deleteListing(String id) {
    return listingRepository.deleteListing(id);
  }
}
