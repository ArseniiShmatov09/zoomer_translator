part of 'translation_history_cubit.dart';

enum TranslationHistoryStateStatus{loading, success, failure}

class TranslationHistoryState {
  const TranslationHistoryState({
    this.translationHistories,
    this.errorText,
    this.status,
  });

  final String? errorText;
  final TranslationHistoryStateStatus? status;
  final List<TranslationHistoryModel>? translationHistories;

  TranslationHistoryState copyWith({
    final String? translatedPhrase,
    final String? errorText,
    final TranslationHistoryStateStatus? status,
    final List<TranslationHistoryModel>? translationHistories,

  }) {
    return TranslationHistoryState(
      translationHistories: translationHistories,
      errorText: errorText,
      status: status,
    );
  }
}