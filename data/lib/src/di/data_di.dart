import 'package:core/core.dart';
import 'package:data/src/providers/ai_provider_impl.dart';
import 'package:data/src/repositories/ai_repository_impl.dart';
import 'package:data/src/repositories/auth_repository_impl.dart';
import 'package:domain/domain.dart';

import '../errors/error_handler.dart';
import '../providers/api_provider.dart';
import '../providers/auth_provider_impl.dart';

abstract class DataDI {
  static void initDependencies(GetIt locator) {
    _initApi(locator);
    _initProviders(locator);
    _initRepositories(locator);
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
    locator.registerFactory<AIProviderImpl>(
      AIProviderImpl.new,
    );
  }

  static void _initRepositories(GetIt locator) {
    locator.registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        authProvider: locator<AuthProviderImpl>(),
      ),
    );

    locator.registerFactory<AIRepository>(
      () => AIRepositoryImpl(
        aiProvider: locator<AIProviderImpl>(),
      ),
    );
  }
}
