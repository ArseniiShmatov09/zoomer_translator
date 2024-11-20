import 'package:domain/src/use_cases/use_case.dart';
import '../../payloads/payloads.dart';
import '../../repositories/auth_repository.dart';

class SignUpUseCase implements FutureUseCase<UserAuthPayload, void> {
  SignUpUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;
  final AuthRepository _authRepository;
  @override
  Future<void> execute(UserAuthPayload payload) {
    return _authRepository.signUp(payload);
  }
}