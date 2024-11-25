import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class TranslationHistoryMapper {
  static TranslationHistoryEntity toDataModel(TranslationHistoryModel history) {
    return TranslationHistoryEntity(
      inputPhrase: history.inputPhrase,
      translatedPhrase: history.translatedPhrase,
      createdAt: Timestamp.fromDate(
        history.createdAt,
      ),
    );
  }

  static TranslationHistoryModel toDomainModel(
      TranslationHistoryEntity history) {
    return TranslationHistoryModel(
      inputPhrase: history.inputPhrase,
      translatedPhrase: history.translatedPhrase,
      createdAt: history.createdAt.toDate(),
    );
  }
}
