import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final SetLoggedInUserUseCase _setLoggedInUserUseCase;

  AuthBloc({
    required SignInUseCase signInUseCase,
    required SignUpUseCase signUpUseCase,
    required SetLoggedInUserUseCase setLoggedInUserUseCase,
  })  : _signInUseCase = signInUseCase,
        _signUpUseCase = signUpUseCase,
        _setLoggedInUserUseCase = setLoggedInUserUseCase,
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
      final UserAuthPayload userAuthPayload = UserAuthPayload(
        email: event.email,
        password: event.password,
      );
      final String email = await _signInUseCase.execute(
        userAuthPayload,
      );
      await _setLoggedInUserUseCase.execute(
        email,
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
      final UserAuthPayload userAuthPayload = UserAuthPayload(
        email: event.email,
        password: event.password,
      );
      final String email = await _signUpUseCase.execute(
        userAuthPayload,
      );
      await _setLoggedInUserUseCase.execute(
        email,
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
