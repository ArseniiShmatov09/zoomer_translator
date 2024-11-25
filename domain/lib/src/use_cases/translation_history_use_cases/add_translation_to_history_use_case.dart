import 'package:domain/domain.dart';

class AddTranslationToHistoryUseCase
    implements FutureUseCase<TranslationHistoryModel, void> {
  TranslationHistoryRepository translationHistoryRepository;

  AddTranslationToHistoryUseCase({
    required this.translationHistoryRepository,
  });

  @override
  Future<void> execute(TranslationHistoryModel translationHistoryModel) {
    return translationHistoryRepository
        .addTranslationToHistory(translationHistoryModel);
  }
}
