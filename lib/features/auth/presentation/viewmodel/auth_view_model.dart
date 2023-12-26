import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/router/app_route.dart';
import '../../../../core/common/snackbar/snackbar_message.dart';
import '../../domain/entity/user_entity.dart';
import '../use_case/auth_usecase.dart';
import '../state/auth_state.dart';

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(
    ref.watch(authUseCaseProvider),
  );
});

class AuthViewModel extends StateNotifier<AuthState> {
  final AuthUseCase _authUseCase;

  AuthViewModel(this._authUseCase) : super(AuthState.initial());

  Future<void> registerUser(BuildContext context, UserEntity user) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.registerUser(user);
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
      showMessageToUser(message: 'User Registered!', context: context);
      Navigator.popAndPushNamed(context, AppRoute.signin);
    });
  }

  Future<void> loginUser(
      BuildContext context, String phone, String password) async {
    state = state.copyWith(isLoading: true);

    var data = await _authUseCase.loginUser(phone, password);
    data.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        showMessageToUser(
            message: failure.error, context: context, color: Colors.red);
      },
      (success) {
        state = state.copyWith(isLoading: false, error: null);
        showMessageToUser(message: 'Welcome', context: context);
        Navigator.popAndPushNamed(context, AppRoute.home);
      },
    );
  }
}
