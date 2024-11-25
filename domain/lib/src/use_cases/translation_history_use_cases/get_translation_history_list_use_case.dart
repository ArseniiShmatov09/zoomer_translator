import 'package:domain/domain.dart';

class GetTranslationHistoryListUseCase
    implements FutureUseCase<NoParams, List<TranslationHistoryModel>> {
  GetTranslationHistoryListUseCase({
    required TranslationHistoryRepository translationHistoryRepository,
  }) : _translationHistoryRepository = translationHistoryRepository;
  final TranslationHistoryRepository _translationHistoryRepository;

  @override
  Future<List<TranslationHistoryModel>> execute(NoParams noParams) {
    return _translationHistoryRepository.getAllCvs();
  }
}
