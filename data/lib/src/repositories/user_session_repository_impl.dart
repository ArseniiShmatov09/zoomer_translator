import 'package:core/core.dart';
import 'package:domain/domain.dart';

import '../providers/shared_preferences_provider.dart';

class UserSessionRepositoryImpl implements UserSessionRepository {
  final SharedPreferencesProvider _preferences;

  UserSessionRepositoryImpl({required SharedPreferencesProvider preferences})
      : _preferences = preferences;

  @override
  Future<void> setLoggedInUser({required String userId}) {
    return _preferences.setUser(
      AppConstants.userKey,
      userId,
    );
  }

  @override
  Future<String?> getLoggedInUser() async {
    return _preferences.getUser(
      AppConstants.userKey,
    );
  }
}
