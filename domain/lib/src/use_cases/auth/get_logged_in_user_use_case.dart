import 'package:domain/domain.dart';

class GetLoggedInUserUseCase implements FutureUseCase<NoParams, void> {
  GetLoggedInUserUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Future<bool> execute(NoParams noParams) async {

    final String? accessToken = await _authRepository.getLoggedInUser();
    if (accessToken != null && accessToken.isNotEmpty) {
      return true;
    }
    else {
      return false;
    }
  }
}
