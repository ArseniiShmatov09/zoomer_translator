import 'package:auth/auth.gm.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/src/presentation/bloc/translation_cubit/translation_cubit.dart';
import 'package:navigation/navigation.dart';

import '../bloc/logout_bloc/logout_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  void _logout(BuildContext context) {
    context.read<LogoutBloc>().add(
          LogoutRequestedEvent(),
        );
    AutoRouter.of(context).replace(
      const SignInRoute(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.of(context).white,
      appBar: AppBar(
        backgroundColor: AppColors.of(context).white,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text('Home'),
        ),
        actions: <Widget>[
          BlocProvider<LogoutBloc>(
            create: (BuildContext context) => LogoutBloc(
              logoutUseCase: appLocator<LogoutUseCase>(),
            ),
            child: Builder(
              builder: (BuildContext localContext) => IconButton(
                icon: const Icon(
                  Icons.logout,
                ),
                onPressed: () {
                  _logout(localContext);
                },
              ),
            ),
          ),
        ],
      ),
      body: const TranslationSection(),
    );
  }
}

class TranslationSection extends StatefulWidget {
  const TranslationSection({super.key});

  @override
  State<TranslationSection> createState() => _TranslationSectionState();
}

class _TranslationSectionState extends State<TranslationSection> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text(
            'Введите фразу для перевода:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Введите текст',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final String inputPhrase = _controller.text.trim();
              if (inputPhrase.isNotEmpty) {
                context
                    .read<TranslationCubit>()
                    .onTranslationRequested(inputPhrase);
              }
            },
            child: const Text('Перевести'),
          ),
          const SizedBox(height: 32),
          BlocBuilder<TranslationCubit, TranslationState>(
            builder: (BuildContext context, TranslationState state) {
              switch (state.status) {
                case TranslationStatus.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );

                case TranslationStatus.success:
                  return Text(
                    'Перевод: ${state.translatedPhrase}',
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  );

                case TranslationStatus.failure:
                  return Text(
                    'Ошибка: ${state.errorText}',
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  );

                default:
                  return const Text(
                    'Введите текст для перевода.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
