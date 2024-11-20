import 'package:core/core.dart';
import 'package:domain/domain.dart';
import '../repositories/auth_repository.dart';
import '../use_cases/export_use_cases.dart';

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
      ),
    );
    locator.registerFactory<GetTranslatedPhraseUseCase>(
      () => GetTranslatedPhraseUseCase(
        aiRepository: locator<AIRepository>(),
      ),
    );
  }
}
