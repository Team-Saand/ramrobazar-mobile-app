import '../../domain/entity/listing_entity.dart';

class ListingState {
  final bool isLoading;
  final String? error;
  final List<ListingEntity>? listing;
  final ListingEntity? singleListing;

  ListingState(
      {this.listing,
      required this.isLoading,
      this.error,
      this.singleListing,
    });

  factory ListingState.initial() {
    return ListingState(
        isLoading: false, error: null, listing: null);
  }

  ListingState copyWith({
    bool? isLoading,
    String? error,
    List<ListingEntity>? listing,
    ListingEntity? singleListing,
  }) {
    return ListingState(
        isLoading: isLoading ?? this.isLoading,
        singleListing: singleListing ?? this.singleListing,
        listing:listing?? this.listing,
       );
  }

  @override
  String toString() => 'ListingState(isLoading: $isLoading, error: $error)';
}
