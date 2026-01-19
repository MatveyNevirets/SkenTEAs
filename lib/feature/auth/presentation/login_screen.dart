import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skenteas/core/widgets/snackbar.dart';
import 'package:skenteas/feature/auth/presentation/bloc/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final loginController = TextEditingController(),
      passwordController = TextEditingController(),
      usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthenticatedState) {
            context.go("/home");
          }
          if (state is UnauthenticatedState && state.message != null) {
            createSnackBar(context, state.message!);
          }
        },
        builder: (context, state) {
          if (state is UnauthenticatedState) {
            // TODO: Redesigned to the normal unauth screen
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Логин"),
                TextField(controller: loginController),
                Text("Пароль"),
                TextField(controller: passwordController),
                Text("Никнейм"),
                TextField(controller: usernameController),
                ElevatedButton(
                  onPressed: () => context.read<AuthBloc>().add(
                    AuthSignInEvent(
                      email: loginController.text,
                      password: passwordController.text,
                    ),
                  ),
                  child: Text("Войти"),
                ),
                ElevatedButton(
                  onPressed: () => context.read<AuthBloc>().add(
                    AuthSignUpEvent(
                      email: loginController.text,
                      password: passwordController.text,
                      username: usernameController.text,
                    ),
                  ),
                  child: Text("Зарегестрироваться"),
                ),
              ],
            );
          } else {
            // TODO: Redesigned to the normal progress indicator
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
