class TranslationHistoryModel {

  final String inputPhrase;
  final String translatedPhrase;
  final DateTime createdAt;

  TranslationHistoryModel({
  required this.inputPhrase,
  required this.translatedPhrase,
  required this.createdAt,
  });
}