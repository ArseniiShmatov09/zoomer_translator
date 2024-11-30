import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;

  AuthBloc({
    required SignInUseCase signInUseCase,
    required SignUpUseCase signUpUseCase,
  })  : _signInUseCase = signInUseCase,
        _signUpUseCase = signUpUseCase,
        super(
          const AuthState(),
        ) {
    on<SignInRequestedEvent>(_onSignInRequested);
    on<SignUpRequestedEvent>(_onSignUpRequested);
  }

  Future<void> _onSignInRequested(
    SignInRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: AuthStatus.loading,
        ),
      );
      final UserAuthPayload userAuthPayload = UserAuthPayload(
        email: event.email,
        password: event.password,
      );
      await _signInUseCase.execute(
        userAuthPayload,
      );

      emit(
        state.copyWith(status: AuthStatus.success),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.failure,
          errorText: e.toString(),
        ),
      );
    }
  }

  Future<void> _onSignUpRequested(
    SignUpRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: AuthStatus.loading,
        ),
      );
      final UserAuthPayload userAuthPayload = UserAuthPayload(
        email: event.email,
        password: event.password,
      );
      await _signUpUseCase.execute(
        userAuthPayload,
      );
      emit(
        state.copyWith(
          status: AuthStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.failure,
          errorText: e.toString(),
        ),
      );
    }
  }
}
