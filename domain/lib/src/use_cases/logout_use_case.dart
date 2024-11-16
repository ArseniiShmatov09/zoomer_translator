import 'package:domain/src/use_cases/use_case.dart';
import '../repositories/auth_repository.dart';

class LogoutUseCase implements FutureUseCase<NoParams, void> {
  LogoutUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<void> execute(NoParams noParams) {
    return _authRepository.logout();
  }
}
