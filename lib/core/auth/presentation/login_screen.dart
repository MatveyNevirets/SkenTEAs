import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skenteas/core/consts/color_consts.dart';
import 'package:skenteas/core/widgets/snackbar.dart';
import 'package:skenteas/core/auth/presentation/bloc/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final loginController = TextEditingController(),
      passwordController = TextEditingController(),
      usernameController = TextEditingController();

  String? avatarImagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBgColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Container(
          decoration: BoxDecoration(
            color: secondaryHighlightedColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(26),
              bottomRight: Radius.circular(26),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Регистрация",
                style: TextStyle(
                  fontSize: 32,
                  color: mainTextColor,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SuccessImageInstalledState) {
            avatarImagePath = state.imagePath;
            // context.read<AuthBloc>().add(aUT)
          }
          if (state is AuthenticatedState) {
            context.go("/home");
          }
          if (state is UnauthenticatedState && state.message != null) {
            createSnackBar(context, state.message!);
          }
        },
        builder: (context, state) {
          if (state is UnauthenticatedState ||
              state is SuccessImageInstalledState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 80, right: 80),
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 700),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 50),
                        _buildInputField(
                          context: context,
                          controller: loginController,
                          hintText: "Введите почту",
                        ),
                        SizedBox(height: 25),
                        _buildInputField(
                          context: context,
                          controller: passwordController,
                          hintText: "Введите пароль",
                        ),
                        SizedBox(height: 25),
                        _buildInputField(
                          context: context,
                          controller: usernameController,
                          hintText: "Введите никнейм",
                        ),
                        SizedBox(height: 25),
                        GestureDetector(
                          onTap: () => context.read<AuthBloc>().add(
                            AuthPickImageEvent(),
                          ),
                          child: CircleAvatar(
                            radius: avatarImagePath != null ? 100 : 50,
                            backgroundColor: obsoleteSecondaryColor,
                            foregroundImage: avatarImagePath != null
                                ? FileImage(File(avatarImagePath!), scale: 200)
                                : null,
                            child: avatarImagePath == null
                                ? Icon(
                                    Icons.photo_camera_outlined,
                                    size: 64,
                                    color: headerTextColor,
                                  )
                                : null,
                          ),
                        ),
                        SizedBox(height: 25),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: secondaryHighlightedColor,
                            foregroundColor: mainTextColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 18),
                          ),
                          onPressed: () => context.read<AuthBloc>().add(
                            AuthSignInEvent(
                              email: loginController.text,
                              password: passwordController.text,
                            ),
                          ),
                          child: Text(
                            "Войти",
                            style: TextStyle(
                              fontSize: 20,
                              color: mainTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () => context.read<AuthBloc>().add(
                            AuthSignUpEvent(
                              email: loginController.text,
                              password: passwordController.text,
                              username: usernameController.text,
                            ),
                          ),
                          child: Text(
                            "Зарегестрироваться (как кнопка)",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                        SizedBox(height: 20),

                        Text(
                          "Или с помощью гугла",
                          style: TextStyle(color: Colors.lightGreen),
                        ),
                        IconButton(
                          onPressed: () => context.read<AuthBloc>().add(
                            AuthGoogleSignInEvent(),
                          ),
                          icon: Icon(Icons.accessibility_new),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: mainHighlightedColor),
            );
          }
        },
      ),
    );
  }
}

// TODO: Move this input field in /core
Widget _buildInputField({
  required BuildContext context,
  required TextEditingController controller,
  required String hintText,
}) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
      color: secondaryBgColor,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: dividerColor, width: 2.5),
    ),
    child: TextField(
      controller: controller,
      style: TextStyle(color: mainTextColor, fontSize: 16),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: mainTextColor, fontSize: 16),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        isDense: true,
      ),
    ),
  );
}
