import 'package:core/core.dart';
import '../repositories/auth_repository.dart';
import '../use_cases/export_use_cases.dart';

abstract class DomainDI {
  static void initDependencies(GetIt locator) {
    _initUseCases(locator);
  }

  static void _initUseCases(GetIt locator) {
    locator.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(
        authRepository: locator<AuthRepository>(),
      ),
    );
    locator.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(
        authRepository: locator<AuthRepository>(),
      ),
    );
    locator.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(
        authRepository: locator<AuthRepository>(),
      ),
    );
  }
}
