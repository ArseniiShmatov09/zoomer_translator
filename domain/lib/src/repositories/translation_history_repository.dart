import 'package:domain/domain.dart';

abstract class TranslationHistoryRepository {
  Future<List<TranslationHistoryModel>> getAllCvs();
  Future<void> addTranslationToHistory(TranslationHistoryModel translationHistoryModel);
}
