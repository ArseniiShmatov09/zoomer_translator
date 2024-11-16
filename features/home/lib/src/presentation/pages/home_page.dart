import 'package:auth/auth.gm.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/logout_bloc/logout_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

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
      ),
      body: BlocProvider<LogoutBloc>(
        create: (BuildContext context) => LogoutBloc(
          logoutUseCase: appLocator<LogoutUseCase>(),
        ),
        child: BlocBuilder<LogoutBloc, LogoutState>(
          builder: (BuildContext context, LogoutState state) {
            return Column(
              children: <Widget>[
                const Center(
                  child: Text('Home page'),
                ),
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    context.read<LogoutBloc>().add(
                      LogoutRequestedEvent(),
                    );
                    AutoRouter.of(context).replace(
                      const SignInRoute(),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
