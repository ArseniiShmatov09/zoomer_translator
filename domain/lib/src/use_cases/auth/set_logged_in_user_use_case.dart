import '../../repositories/repositories.dart';
import '../export_use_cases.dart';

class SetLoggedInUserUseCase implements FutureUseCase<String, void> {
  SetLoggedInUserUseCase({
    required UserSessionRepository userSessionRepository,
  }) : _userSessionRepository = userSessionRepository;

  final UserSessionRepository _userSessionRepository;

  @override
  Future<void> execute(String userId) async {
    return _userSessionRepository.setLoggedInUser(userId: userId);
  }
}
