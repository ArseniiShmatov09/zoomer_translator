import 'package:domain/domain.dart';

class LogoutUseCase implements FutureUseCase<NoParams, void> {
  LogoutUseCase({
    required AuthRepository authRepository,
    required UserSessionRepository userSessionRepository,
  }) : _authRepository = authRepository,
        _userSessionRepository = userSessionRepository;

  final AuthRepository _authRepository;
  final UserSessionRepository _userSessionRepository;

  @override
  Future<void> execute(NoParams noParams) async {
    await _authRepository.logout();
    await _userSessionRepository.setLoggedInUser(userId: '');
  }
}