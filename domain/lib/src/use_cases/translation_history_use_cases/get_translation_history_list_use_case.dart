import 'package:domain/domain.dart';

class GetTranslationHistoryListUseCase
    implements FutureUseCase<GetTranslationHistoryListPayload, List<TranslationHistoryModel>> {
  GetTranslationHistoryListUseCase({
    required TranslationHistoryRepository translationHistoryRepository,
  }) : _translationHistoryRepository = translationHistoryRepository;
  final TranslationHistoryRepository _translationHistoryRepository;

  @override
  Future<List<TranslationHistoryModel>> execute(GetTranslationHistoryListPayload payload) {
    return _translationHistoryRepository.getAllCvs(payload);
  }
}
