part of 'auth_bloc.dart';
enum AuthStatus { loading, success, failure }
class AuthState {
  const AuthState({
    this.status = AuthStatus.loading,
    this.errorText = '',
  });
  final AuthStatus status;
  final String errorText;
  AuthState copyWith({
    AuthStatus? status,
    String errorText = '',
  }) {
    return AuthState(
      status: status ?? this.status,
      errorText: errorText,
    );
  }
}