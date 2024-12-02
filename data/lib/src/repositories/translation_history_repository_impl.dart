import 'package:data/data.dart';
import 'package:data/src/providers/translation_history_provider.dart';
import 'package:domain/domain.dart';

class TranslationHistoryRepositoryImpl implements TranslationHistoryRepository {
  TranslationHistoryProvider translationHistoryProvider;

  TranslationHistoryRepositoryImpl({
    required this.translationHistoryProvider,
  });

  @override
  Future<List<TranslationHistoryModel>> getAllCvs(GetTranslationHistoryListPayload payload) async {
    List<TranslationHistoryEntity> translationHistoryEntities =
        await translationHistoryProvider.getTranslationHistoryList(payload);
    return translationHistoryEntities
        .map(TranslationHistoryMapper.toDomainModel)
        .toList();
  }

  @override
  Future<void> addTranslationToHistory(
      TranslationHistoryModel translationHistoryModel) {
    return translationHistoryProvider.addTranslationToHistory(
      TranslationHistoryMapper.toDataModel(translationHistoryModel).toMap(),
    );
  }
}
