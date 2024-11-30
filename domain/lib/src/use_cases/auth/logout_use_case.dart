import 'package:domain/domain.dart';

class LogoutUseCase implements FutureUseCase<NoParams, void> {
  LogoutUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Future<void> execute(NoParams noParams) async {
    await _authRepository.logout();
  }
}
