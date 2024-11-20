import 'package:domain/src/repositories/repositories.dart';

import '../export_use_cases.dart';

class GetLoggedInUserUseCase implements FutureUseCase<NoParams, void> {
  GetLoggedInUserUseCase({
    required UserSessionRepository userSessionRepository,
  }) : _userSessionRepository = userSessionRepository;

  final UserSessionRepository _userSessionRepository;

  @override
  Future<bool> execute(NoParams noParams) async {

    final String? userId = await _userSessionRepository.getLoggedInUser();
    if (userId != null && userId.isNotEmpty) {
      return true;
    }
    else {
      return false;
    }
  }
}
