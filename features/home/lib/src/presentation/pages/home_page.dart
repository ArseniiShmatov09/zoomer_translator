import 'package:auth/auth.gm.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/src/presentation/bloc/translation_cubit/translation_cubit.dart';
import 'package:navigation/navigation.dart';
import 'package:translation_history/translation_history.gm.dart';

import '../bloc/logout_bloc/logout_bloc.dart';
import '../widgets/translation_section.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _logout(BuildContext context) {
    context.read<LogoutBloc>().add(
          LogoutRequestedEvent(),
        );
    AutoRouter.of(context).replace(
      const SignInRoute(),
    );
  }

  void _navigateToHistory(BuildContext context) {
    AutoRouter.of(context).push(
      const TranslationHistoryRoute(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LogoutBloc>(
          create: (BuildContext context) => LogoutBloc(
            logoutUseCase: appLocator<LogoutUseCase>(),
          ),
        ),
        BlocProvider<TranslationCubit>(
          create: (BuildContext context) => TranslationCubit(
            getTranslatedPhraseUseCase:
                appLocator<GetTranslatedPhraseUseCase>(),
            addTranslationToHistoryUseCase:
                appLocator<AddTranslationToHistoryUseCase>(),
          ),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.of(context).black,
        appBar: AppBar(
          backgroundColor: AppColors.of(context).black,
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text('Home'),
          ),
          actions: <Widget>[
            Builder(
              builder: (BuildContext localContext) => IconButton(
                icon: Icon(
                  Icons.logout,
                  color: AppColors.of(context).white,
                ),
                onPressed: () {
                  _logout(localContext);
                },
              ),
            ),
          ],
        ),
        body: const TranslationSection(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _navigateToHistory(context),
          backgroundColor: AppColors.of(context).white,
          child: Icon(
            Icons.history_toggle_off,
            color: AppColors.of(context).black,
          ),
        ),
      ),
    );
  }
}
