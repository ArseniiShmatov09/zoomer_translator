abstract class UserSessionRepository {

  Future<void> setLoggedInUser({required String userId});

  Future<String?> getLoggedInUser();
}