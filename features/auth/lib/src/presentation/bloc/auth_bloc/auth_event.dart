part of 'auth_bloc.dart';
abstract class AuthEvent {
  List<Object?> get props => <Object?>[];
}
class SignInRequestedEvent extends AuthEvent {
  final String email;
  final String password;
  SignInRequestedEvent(
      this.email,
      this.password,
      );
  @override
  List<Object?> get props => <Object?>[
    email,
    password,
  ];
}

class SignUpRequestedEvent extends AuthEvent {
  final String email;
  final String password;
  SignUpRequestedEvent(
      this.email,
      this.password,
      );
  @override
  List<Object?> get props => <Object?>[
    email,
    password,
  ];
}