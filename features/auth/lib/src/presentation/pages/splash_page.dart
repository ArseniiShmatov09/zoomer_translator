import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/home.gm.dart';
import 'package:navigation/navigation.dart';

import '../../../auth.gm.dart';
import '../bloc/user_session_bloc/user_session_bloc.dart';


@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (BuildContext context) => SplashBloc(
        getLoggedInUserUseCase: appLocator<GetLoggedInUserUseCase>(),
      ),
      child: BlocBuilder<SplashBloc, SplashState>(
        builder: (BuildContext context, SplashState state) {
          switch (state.status) {
            case SplashStatus.loading:
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.of(context).white,
                ),
              );

            case SplashStatus.authenticated:
              AutoRouter.of(context).replace(
                const HomeRoute(),
              );
              break;

            case SplashStatus.unauthenticated:
              AutoRouter.of(context).replace(
                const SignInRoute(),
              );
              break;
          }

          return CircularProgressIndicator(
            color: AppColors.of(context).black,
          );
        },
      ),
    );
  }
}
