import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'translation_history_state.dart';

class TranslationHistoryCubit extends Cubit<TranslationHistoryState> {
  final GetTranslationHistoryListUseCase _getTranslationHistoryListUseCase;

  TranslationHistoryCubit({
    required GetTranslationHistoryListUseCase getTranslationHistoryListUseCase,
  })  : _getTranslationHistoryListUseCase = getTranslationHistoryListUseCase,
        super(
          const TranslationHistoryState(),
        ) {
    fetchHistory();
  }

  Future<void> fetchHistory() async {
    try {
      emit(
        state.copyWith(
          status: TranslationHistoryStateStatus.loading,
        ),
      );
      List<TranslationHistoryModel> translationHistories =
          await _getTranslationHistoryListUseCase.execute(
        const NoParams(),
      );
      emit(
        state.copyWith(
          status: TranslationHistoryStateStatus.success,
          translationHistories: translationHistories,
        ),
      );
    } on Exception catch (e) {
      emit(
        state.copyWith(
          status: TranslationHistoryStateStatus.failure,
          errorText: e.toString(),
        ),
      );
    }
  }
}
