import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:data/src/entities/translation_history_entity.dart';
import 'package:data/src/providers/translation_history_provider.dart';
import 'package:domain/domain.dart';

class TranslationHistoryProviderImpl implements TranslationHistoryProvider {
  final CollectionReference<Map<String, dynamic>> _translationHistory =
      FirebaseFirestore.instance.collection(
    AppConstants.translationHistoryCollection,
  );

  @override
  Future<List<TranslationHistoryEntity>> getTranslationHistoryList(
      GetTranslationHistoryListPayload payload) async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _translationHistory
            .where(
              'userId',
              isEqualTo: payload.userId,
            )
            .orderBy(
              'createdAt',
              descending: true,
            )
            .get();
    return querySnapshot.docs
        .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
      return TranslationHistoryEntity.fromMap(
        doc.data(),
      );
    }).toList();
  }

  @override
  Future<void> addTranslationToHistory(Map<String, dynamic> data) {
    return _translationHistory.add(data);
  }
}
