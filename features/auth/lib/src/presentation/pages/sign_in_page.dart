import 'package:auth/auth.gm.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/home.gm.dart';
import 'package:navigation/navigation.dart';
import '../bloc/auth_bloc/auth_bloc.dart';

@RoutePage()
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final TextEditingController emailController;

  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (BuildContext context) => AuthBloc(
        signInUseCase: appLocator<SignInUseCase>(),
        signUpUseCase: appLocator<SignUpUseCase>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.of(context).black,
          title: Text(
            'Sign In',
            style: TextStyle(
              color: AppColors.of(context).white,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: AppColors.of(context).black,
        body: Padding(
          padding: const EdgeInsets.all(AppDimens.padding20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: AppDimens.padding20),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: AppDimens.padding20),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (BuildContext context, AuthState state) {
                  if (state.status == AuthStatus.success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Successful signed in!'),
                      ),
                    );
                    AutoRouter.of(context).replace(
                      const HomeRoute(),
                    );
                  } else if (state.status == AuthStatus.failure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errorText),
                      ),
                    );
                  }
                },
                builder: (BuildContext context, AuthState state) {
                  return ElevatedButton(
                    onPressed: () {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Fill in the empty fields'),
                          ),
                        );
                        return;
                      }
                      context.read<AuthBloc>().add(
                            SignInRequestedEvent(
                              emailController.text,
                              passwordController.text,
                            ),
                          );
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: AppColors.of(context).black,
                      ),
                    ),
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  AutoRouter.of(context).replace(
                    const SignUpRoute(),
                  );
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: AppColors.of(context).white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}