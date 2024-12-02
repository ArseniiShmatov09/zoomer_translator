import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'translation_history_state.dart';

class TranslationHistoryCubit extends Cubit<TranslationHistoryState> {
  final GetTranslationHistoryListUseCase _getTranslationHistoryListUseCase;
  final GetCurrentUserIdUseCase _getCurrentUserIdUseCase;

  TranslationHistoryCubit({
    required GetTranslationHistoryListUseCase getTranslationHistoryListUseCase,
    required GetCurrentUserIdUseCase getCurrentUserIdUseCase,
  })  : _getTranslationHistoryListUseCase = getTranslationHistoryListUseCase,
        _getCurrentUserIdUseCase = getCurrentUserIdUseCase,
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
      final String userId = await _getCurrentUserIdUseCase.execute(
        const NoParams(),
      );

      GetTranslationHistoryListPayload payload =
          GetTranslationHistoryListPayload(userId: userId);
      List<TranslationHistoryModel> translationHistories =
          await _getTranslationHistoryListUseCase.execute(payload);
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
