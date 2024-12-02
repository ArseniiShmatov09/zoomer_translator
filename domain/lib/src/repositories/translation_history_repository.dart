import 'package:domain/domain.dart';

abstract class TranslationHistoryRepository {
  Future<List<TranslationHistoryModel>> getAllCvs(GetTranslationHistoryListPayload payload);
  Future<void> addTranslationToHistory(TranslationHistoryModel translationHistoryModel);
}
