import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:home/src/presentation/bloc/translation_cubit/translation_cubit.dart';

class TranslationSection extends StatefulWidget {
  const TranslationSection({super.key});

  @override
  State<TranslationSection> createState() => _TranslationSectionState();
}

class _TranslationSectionState extends State<TranslationSection> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            height: AppDimens.padding20,
          ),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Введите фразу для перевода',
            ),
          ),
          const SizedBox(
            height: AppDimens.padding20,
          ),
          ElevatedButton(
            onPressed: () => _translatePhrase(context),
            child: Text(
              'Перевести',
              style: TextStyle(
                color: AppColors.of(context).black,
              ),
            ),
          ),
          const SizedBox(
            height: AppDimens.padding20,
          ),
          BlocConsumer<TranslationCubit, TranslationState>(
            listener: (BuildContext context, TranslationState state) {
              if (state.status == TranslationStatus.failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Ошибка: ${state.errorText}'),
                    backgroundColor: AppColors.of(context).red,
                  ),
                );
              }
            },
            builder: (BuildContext context, TranslationState state) {
              switch (state.status) {
                case TranslationStatus.loading:
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.of(context).white,
                    ),
                  );

                case TranslationStatus.success:
                  return Text(
                    '${state.translatedPhrase}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  );

                case TranslationStatus.failure:
                  return const Text(
                    'Ошибка при переводе',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  );

                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }

  void _translatePhrase(BuildContext context) {
    {
      final String inputPhrase = _controller.text.trim();
      if (inputPhrase.isNotEmpty) {
        context.read<TranslationCubit>().onTranslationRequested(inputPhrase);
      }
    }
  }
}
