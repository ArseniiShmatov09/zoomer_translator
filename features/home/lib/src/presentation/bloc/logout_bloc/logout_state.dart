part of 'logout_bloc.dart';
class LogoutState {
  const LogoutState({
    this.errorText,
  });
  final String? errorText;
  LogoutState copyWith({
    String? user,
    String errorText = '',
  }) {
    return LogoutState(
      errorText: errorText,
    );
  }
}