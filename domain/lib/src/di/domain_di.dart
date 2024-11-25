import 'package:core/core.dart';
import 'package:domain/domain.dart';

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

    locator.registerFactory<SignUpUseCase>(
      () => SignUpUseCase(
        authRepository: locator<AuthRepository>(),
      ),
    );

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

    locator.registerFactory<GetTranslationHistoryListUseCase>(
      () => GetTranslationHistoryListUseCase(
        translationHistoryRepository: locator<TranslationHistoryRepository>(),
      ),
    );

    locator.registerFactory<AddTranslationToHistoryUseCase>(
          () => AddTranslationToHistoryUseCase(
        translationHistoryRepository: locator<TranslationHistoryRepository>(),
      ),
    );

  }
}
