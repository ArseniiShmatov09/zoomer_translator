import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'user_session_event.dart';

part 'user_session_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetLoggedInUserUseCase _getLoggedInUserUseCase;

  SplashBloc({
    required GetLoggedInUserUseCase getLoggedInUserUseCase,
  })  : _getLoggedInUserUseCase = getLoggedInUserUseCase,
        super(
          const SplashState(),
        ) {
    on<SplashRequest>(_onAuthCheckRequested);
    add(
      SplashRequest(),
    );
  }

  Future<void> _onAuthCheckRequested(
    SplashRequest event,
    Emitter<SplashState> emit,
  ) async {
    emit(
      state.copyWith(
        status: SplashStatus.loading,
      ),
    );
    final bool isAuthorized = await _getLoggedInUserUseCase.execute(
      const NoParams(),
    );
    final SplashStatus status = isAuthorized
        ? SplashStatus.authenticated
        : SplashStatus.unauthenticated;
    emit(
      state.copyWith(
        status: status,
      ),
    );
  }
}
