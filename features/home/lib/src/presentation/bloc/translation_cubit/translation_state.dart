part of 'translation_cubit.dart';

enum TranslationStatus{loading, success, failure}

class TranslationState {
  const TranslationState({
    this.translatedPhrase,
    this.errorText,
    this.status,
  });

  final String? translatedPhrase;
  final String? errorText;
  final TranslationStatus? status;

  TranslationState copyWith({
    final String? translatedPhrase,
    final String? errorText,
    final TranslationStatus? status,
  }) {
    return TranslationState(
      translatedPhrase: translatedPhrase,
      errorText: errorText,
      status: status,
    );
  }
}