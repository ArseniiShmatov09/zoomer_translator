import 'package:data/src/entities/entities.dart';
import 'package:domain/domain.dart';

abstract class TranslationHistoryProvider {
  Future<List<TranslationHistoryEntity>> getTranslationHistoryList();
  Future<void> addTranslationToHistory(Map<String, dynamic> data);

}
