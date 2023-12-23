import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/router/app_route.dart';
import '../../../../core/common/snackbar/snackbar_message.dart';
import '../../domain/entity/listing_entity.dart';
import '../../domain/use_case/listing_usecase.dart';
import '../state/listing_state.dart';

final listingViewModelProvider =
    StateNotifierProvider<ListingViewModel, ListingState>((ref) {
  return ListingViewModel(ref.watch(listingUseCaseProvider));
});

class ListingViewModel extends StateNotifier<ListingState> {
  final AdUseCase _listingUsecase;

  ListingViewModel(this._listingUsecase) : super(ListingState.initial()) {
    getAllListing();
  }

  Future<void> addListing(
      {required BuildContext context, required ListingEntity listing}) async {
    state = state.copyWith(isLoading: true);
    var data = await _listingUsecase.addListing(listing);
    data.fold((failure) {
      state = state.copyWith(
        isLoading: false,
        error: failure.error,
      );
      showMessageToUser(
          message: failure.toString(), context: context, color: Colors.red);
    }, (success) {
      state = state.copyWith(
        isLoading: false,
        error: null,
      );
      getAllListing();
      showMessageToUser(message: 'Listing Created!', context: context);
      Navigator.popAndPushNamed(context, AppRoute.home);
    });
  }

  Future<void> updateListing(
      {required BuildContext context, required ListingEntity listing}) async {
    state = state.copyWith(isLoading: true);
    var data = await _listingUsecase.updateListing(listing);
    data.fold((failure) {
      state = state.copyWith(
        isLoading: false,
        error: failure.error,
      );
      showMessageToUser(
          message: failure.error, context: context, color: Colors.red);
    }, (success) {
      state = state.copyWith(
        isLoading: false,
        error: null,
      );
      showMessageToUser(context: context, message: "Listing info updated.");
      getAllListing();
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    });
  }

  Future<void> getAllListing() async {
    state = state.copyWith(isLoading: true);
    var data = await _listingUsecase.getAllListing();
    data.fold(
      (left) => state = state.copyWith(isLoading: false, error: left.error),
      (right) =>
          state = state.copyWith(isLoading: false, listing: right, error: null),
    );
  }

  Future<void> getSingleListing(String id) async {
    state = state.copyWith(isLoading: true);
    var data = await _listingUsecase.getSingleListing(id);
    data.fold(
      (left) => state = state.copyWith(isLoading: false, error: left.error),
      (right) => state = state.copyWith(
          isLoading: false,
          singleListing: right['listing'],
          error: null),
    );
  }

  Future<void> deleteListing(
      {required BuildContext context, required String id}) async {
    state = state.copyWith(isLoading: true);
    var data = await _listingUsecase.deleteListing(id);
    data.fold((failure) {
      state = state.copyWith(
        isLoading: false,
        error: failure.error,
      );
      showMessageToUser(
          message: failure.error, context: context, color: Colors.red);
    }, (success) {
      state = state.copyWith(
        isLoading: false,
        error: null,
      );
      getAllListing();
      showMessageToUser(context: context, message: "Listing deleted.");
      Navigator.popAndPushNamed(context, AppRoute.home);
    });
  }
}
