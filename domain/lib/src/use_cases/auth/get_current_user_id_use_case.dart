import '../../repositories/auth_repository.dart';
import '../use_case.dart';

class GetCurrentUserIdUseCase implements FutureUseCase<NoParams, String> {
  GetCurrentUserIdUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Future<String> execute(NoParams noParams) async {
    return _authRepository.getCurrentUserId();
  }
}
