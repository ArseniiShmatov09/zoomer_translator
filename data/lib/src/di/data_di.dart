import 'package:core/core.dart';
import 'package:data/src/repositories/auth_repository_impl.dart';
import 'package:data/src/repositories/user_session_repository_impl.dart';
import 'package:domain/domain.dart';

import '../../data.dart';
import '../providers/auth_provider_impl.dart';
import '../providers/shared_preferences_provider.dart';

abstract class DataDI {
  static void initDependencies(GetIt locator) {
    _initApi(locator);
    _initProviders(locator);
    _initRepositories(locator);
    _initSharedPreferences(locator);
  }

  static void _initApi(GetIt locator) {
    locator.registerLazySingleton<DioConfig>(
      () => DioConfig(
        appConfig: locator<AppConfig>(),
      ),
    );

    locator.registerLazySingleton<ErrorHandler>(
      () => ErrorHandler(
        eventNotifier: locator<AppEventNotifier>(),
      ),
    );

    locator.registerLazySingleton<ApiProvider>(
      () => ApiProvider(
        locator<DioConfig>().dio,
      ),
    );
  }

  static void _initProviders(GetIt locator) {
    locator.registerFactory<AuthProviderImpl>(
      AuthProviderImpl.new,
    );
  }

  static Future<void> _initSharedPreferences(GetIt locator) async {
    final SharedPreferencesProvider sharedPreferencesProvider =
    await SharedPreferencesProvider.init();
    locator.registerLazySingleton<SharedPreferencesProvider>(
          () => sharedPreferencesProvider,
    );
  }

  static void _initRepositories(GetIt locator) {
    locator.registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        authProvider: locator<AuthProviderImpl>(),
      ),
    );

    locator.registerFactory<UserSessionRepository>(
          () => UserSessionRepositoryImpl(
        preferences: locator<SharedPreferencesProvider>(),
      ),
    );
  }
}
