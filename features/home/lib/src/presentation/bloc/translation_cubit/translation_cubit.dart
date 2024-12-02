import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'translation_state.dart';

class TranslationCubit extends Cubit<TranslationState> {
  final GetTranslatedPhraseUseCase _getTranslatedPhraseUseCase;
  final AddTranslationToHistoryUseCase _addTranslationToHistoryUseCase;
  final GetCurrentUserIdUseCase _getCurrentUserIdUseCase;

  TranslationCubit({
    required GetTranslatedPhraseUseCase getTranslatedPhraseUseCase,
    required AddTranslationToHistoryUseCase addTranslationToHistoryUseCase,
    required GetCurrentUserIdUseCase getCurrentUserIdUseCase,
  })  : _getTranslatedPhraseUseCase = getTranslatedPhraseUseCase,
        _addTranslationToHistoryUseCase = addTranslationToHistoryUseCase,
        _getCurrentUserIdUseCase = getCurrentUserIdUseCase,
        super(
          const TranslationState(),
        );

  Future<void> onTranslationRequested(String inputPhrase) async {
    try {
      emit(
        state.copyWith(
          status: TranslationStatus.loading,
        ),
      );
      final String userId =  await _getCurrentUserIdUseCase.execute(const NoParams(),);

      GetTranslatedPhrasePayload payload = GetTranslatedPhrasePayload(
        inputPhrase: inputPhrase,
        userId: userId,
      );

      final String translatedPhrase =
          await _getTranslatedPhraseUseCase.execute(payload);
      TranslationHistoryModel translationHistoryModel = TranslationHistoryModel(
        inputPhrase: inputPhrase,
        translatedPhrase: translatedPhrase,
        createdAt: DateTime.now(),
        userId: userId,
      );
      _addTranslationToHistoryUseCase.execute(translationHistoryModel);
      emit(
        state.copyWith(
          status: TranslationStatus.success,
          translatedPhrase: translatedPhrase,
        ),
      );
    } on Exception catch (e) {
      emit(
        state.copyWith(
          status: TranslationStatus.failure,
          errorText: e.toString(),
        ),
      );
    }
  }
}
