import 'package:domain/src/use_cases/use_case.dart';
import '../../payloads/payloads.dart';
import '../../repositories/auth_repository.dart';

class SignUpUseCase implements FutureUseCase<UserAuthPayload, String> {
  SignUpUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;
  final AuthRepository _authRepository;
  @override
<<<<<<<< HEAD:domain/lib/src/use_cases/auth_use_cases/sign_up_use_case.dart
  Future<void> execute(UserAuthPayload payload) {
    return _authRepository.signUp(payload);
========
  Future<String> execute(UserAuthPayload userAuthPayload) {
    return _authRepository.signUp(userAuthPayload);
>>>>>>>> 9f504f845f8fa0f6c6cedf4cc4ca273ea3a01537:domain/lib/src/use_cases/auth/sign_up_use_case.dart
  }
}