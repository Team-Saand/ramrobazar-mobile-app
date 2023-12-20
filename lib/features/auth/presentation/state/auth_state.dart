import '../../domain/entity/user_entity.dart';

class AuthState {
  final bool isLoading;
  final String? error;
  final UserEntity? user;

  AuthState({this.user, required this.isLoading, this.error});

  factory AuthState.initial() {
    return AuthState(isLoading: false, error: null, user: null);
  }

  AuthState copyWith({
    bool? isLoading,
    String? error,
    UserEntity? user,
  }) {
    return AuthState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        user: user ?? this.user);
  }

  @override
  String toString() => 'AuthState(isLoading: $isLoading, error: $error)';
}
