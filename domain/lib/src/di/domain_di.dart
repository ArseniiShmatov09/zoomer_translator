import 'package:core/core.dart';
import 'package:domain/domain.dart';
<<<<<<< HEAD
import '../repositories/auth_repository.dart';
import '../use_cases/export_use_cases.dart';
=======
>>>>>>> 9f504f845f8fa0f6c6cedf4cc4ca273ea3a01537

abstract class DomainDI {
  static void initDependencies(GetIt locator) {
    _initUseCases(locator);
  }

  static void _initUseCases(GetIt locator) {
    locator.registerFactory<SignInUseCase>(
      () => SignInUseCase(
        authRepository: locator<AuthRepository>(),
      ),
    );
<<<<<<< HEAD
=======

>>>>>>> 9f504f845f8fa0f6c6cedf4cc4ca273ea3a01537
    locator.registerFactory<SignUpUseCase>(
      () => SignUpUseCase(
        authRepository: locator<AuthRepository>(),
      ),
    );
<<<<<<< HEAD
=======

>>>>>>> 9f504f845f8fa0f6c6cedf4cc4ca273ea3a01537
    locator.registerFactory<LogoutUseCase>(
      () => LogoutUseCase(
        authRepository: locator<AuthRepository>(),
        userSessionRepository: locator<UserSessionRepository>(),
      ),
    );

    locator.registerFactory<GetLoggedInUserUseCase>(
      () => GetLoggedInUserUseCase(
        userSessionRepository: locator<UserSessionRepository>(),
      ),
    );

    locator.registerFactory<SetLoggedInUserUseCase>(
      () => SetLoggedInUserUseCase(
        userSessionRepository: locator<UserSessionRepository>(),
      ),
    );
    locator.registerFactory<GetTranslatedPhraseUseCase>(
      () => GetTranslatedPhraseUseCase(
        aiRepository: locator<AIRepository>(),
      ),
    );
  }
}
