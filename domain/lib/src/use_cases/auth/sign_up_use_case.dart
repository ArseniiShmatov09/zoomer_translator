import 'package:domain/src/use_cases/use_case.dart';
import '../../payloads/payloads.dart';
import '../../repositories/auth_repository.dart';

class SignUpUseCase implements FutureUseCase<UserAuthPayload, String> {
  SignUpUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;
  final AuthRepository _authRepository;
  @override
  Future<String> execute(UserAuthPayload userAuthPayload) {
    return _authRepository.signUp(userAuthPayload);
  }
}