class TranslationHistoryModel {
  final String inputPhrase;
  final String translatedPhrase;
  final DateTime createdAt;
  final String userId;

  TranslationHistoryModel({
    required this.inputPhrase,
    required this.translatedPhrase,
    required this.createdAt,
    required this.userId,
  });
}
