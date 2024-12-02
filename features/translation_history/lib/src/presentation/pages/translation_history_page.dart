import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import '../cubit/translation_history_cubit.dart';

@RoutePage()
class TranslationHistoryPage extends StatelessWidget {
  const TranslationHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translation History'),
      ),
      body: BlocProvider<TranslationHistoryCubit>(
        create: (_) => TranslationHistoryCubit(
          getTranslationHistoryListUseCase:
              appLocator<GetTranslationHistoryListUseCase>(),
          getCurrentUserIdUseCase: appLocator<GetCurrentUserIdUseCase>(),
        ),
        child: BlocBuilder<TranslationHistoryCubit, TranslationHistoryState>(
          builder: (context, state) {
            switch (state.status) {
              case TranslationHistoryStateStatus.loading:
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.of(context).black,
                  ),
                );
              case TranslationHistoryStateStatus.success:
                if (state.translationHistories == null ||
                    state.translationHistories!.isEmpty) {
                  return Center(
                    child: Text(
                      'No history yet:(',
                      style: TextStyle(
                        color: AppColors.of(context).black,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: state.translationHistories!.length,
                  itemBuilder: (context, index) {
                    final history = state.translationHistories![index];
                    return ListTile(
                      title: Text(history.inputPhrase),
                      subtitle: Text(history.translatedPhrase),
                      trailing: Text(
                        DateFormat('yyyy-MM-dd HH:mm')
                            .format(history.createdAt),
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  },
                );
              case TranslationHistoryStateStatus.failure:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error, size: 48, color: Colors.red),
                      const SizedBox(
                        height: AppDimens.padding20,
                      ),
                      Text(
                        state.errorText ?? 'An error occurred',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(
                        height: AppDimens.padding20,
                      ),
                      ElevatedButton(
                        onPressed: () => context
                            .read<TranslationHistoryCubit>()
                            .fetchHistory(),
                        child: Text(
                          'Retry',
                          style: TextStyle(
                            color: AppColors.of(context).black,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
