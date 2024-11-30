import 'package:auth/auth.gm.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/home.gm.dart';
import 'package:navigation/navigation.dart';

import '../bloc/auth_bloc/auth_bloc.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
        signUpUseCase: appLocator<SignUpUseCase>(),
        signInUseCase: appLocator<SignInUseCase>(),
      ),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (BuildContext context, AuthState state) {
          if (state.status == AuthStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Successfully registered!'),
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
          if (state.status == AuthStatus.loading) {
            return Scaffold(
              backgroundColor: AppColors.of(context).black,
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.of(context).black,
              title: Text(
                'Sign Up',
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
                  ElevatedButton(
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
                        SignUpRequestedEvent(
                          emailController.text,
                          passwordController.text,
                        ),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: AppColors.of(context).black,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      AutoRouter.of(context).replace(
                        const SignInRoute(),
                      );
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: AppColors.of(context).white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

