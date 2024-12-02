import 'package:cloud_firestore/cloud_firestore.dart';

class TranslationHistoryEntity {
  final String inputPhrase;
  final String translatedPhrase;
  final Timestamp createdAt;
  final String userId;

  TranslationHistoryEntity({
    required this.inputPhrase,
    required this.translatedPhrase,
    required this.createdAt,
    required this.userId,
  });

  static TranslationHistoryEntity fromMap(Map<String, dynamic> map) {
    return TranslationHistoryEntity(
      inputPhrase: map['inputPhrase'],
      translatedPhrase: map['translatedPhrase'],
      createdAt: map['createdAt'],
      userId: map['userId'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'inputPhrase': inputPhrase,
      'translatedPhrase': translatedPhrase,
      'createdAt': createdAt,
      'userId' : userId,
    };
  }
}
