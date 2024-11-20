import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'translation_state.dart';

class TranslationCubit extends Cubit<TranslationState> {
  final GetTranslatedPhraseUseCase _getTranslatedPhraseUseCase;

  TranslationCubit({
    required GetTranslatedPhraseUseCase getTranslatedPhraseUseCase,
  })  : _getTranslatedPhraseUseCase = getTranslatedPhraseUseCase,
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

      GetTranslatedPhrasePayload payload = GetTranslatedPhrasePayload(
        inputPhrase: inputPhrase,
      );
      String translatedPhrase =
          await _getTranslatedPhraseUseCase.execute(payload);
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
