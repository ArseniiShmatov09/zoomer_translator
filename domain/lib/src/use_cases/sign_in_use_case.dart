import 'package:domain/src/use_cases/use_case.dart';
import '../payloads/payloads.dart';
import '../repositories/auth_repository.dart';

class SignInUseCase implements FutureUseCase<UserAuthPayload, void> {
  SignInUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;
  final AuthRepository _authRepository;
  @override
  Future<void> execute(UserAuthPayload userAuthPayload) {
    return _authRepository.signIn(userAuthPayload);
  }
}