import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:skenteas/core/consts/color_consts.dart';
import 'package:skenteas/core/widgets/snackbar.dart';
import 'package:skenteas/core/auth/presentation/bloc/auth_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final loginController = TextEditingController(),
      passwordController = TextEditingController(),
      usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorTheme.scaffoldBackgroundColor,
      body: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  SvgPicture.asset(
                    'assets/images/logo.svg',
                    width: 175,
                    height: 175,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 60),
                  Text(
                    "Регистрация",
                    style: TextStyle(
                      fontFamily: 'MisterBrush',
                      fontSize: 40,
                      color: colorTheme.primaryColorDark,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 45),
                  _buildInputField(
                    context: context,
                    controller: TextEditingController(),
                    hintText: 'Введите почту',
                  ),
                  SizedBox(height: 20),
                  _buildInputField(
                    context: context,
                    controller: TextEditingController(),
                    hintText: 'Введите пароль',
                  ),
                  SizedBox(height: 20),
                  _buildInputField(
                    context: context,
                    controller: TextEditingController(),
                    hintText: 'Повторите пароль',
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: SizedBox(
                      height: 60,
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: colorTheme.splashColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Продолжить",
                            style: TextStyle(
                              fontFamily: 'MisterBrush',
                              fontSize: 25,
                              color: colorTheme.scaffoldBackgroundColor,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Или зарегистрируйтесь через:",
                    style: TextStyle(
                      fontFamily: 'MisterBrush',
                      fontSize: 15,
                      color: colorTheme.primaryColorDark,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      spacing: 40,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/vk.svg',
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        SvgPicture.asset(
                          'assets/images/google.svg',
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        SvgPicture.asset(
                          'assets/images/yandex.svg',
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildInputField({
  required BuildContext context,
  required TextEditingController controller,
  required String hintText,
}) {
  final colorTheme = Theme.of(context);
  return Padding(
    padding: const EdgeInsets.only(left: 40, right: 40),
    child: SizedBox(
      height: 60,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: colorTheme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: colorTheme.hoverColor, width: 2.5),
        ),
        child: TextField(
          controller: controller,
          style: TextStyle(color: colorTheme.primaryColorDark, fontSize: 16),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: colorTheme.hintColor, fontSize: 16),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            isDense: true,
          ),
        ),
      ),
    ),
  );
}


// TODO: Remove this bloc consumer
// body: BlocConsumer<AuthBloc, AuthState>(
      //   listener: (context, state) {
      //     if (state is SuccessImageInstalledState) {
      //       avatarImagePath = state.imagePath;
      //       // context.read<AuthBloc>().add(aUT)
      //     }
      //     if (state is AuthenticatedState) {
      //       context.go("/home");
      //     }
      //     if (state is UnauthenticatedState && state.message != null) {
      //       createSnackBar(context, state.message!);
      //     }
      //   },
      //   builder: (context, state) {
      //     if (state is UnauthenticatedState ||
      //         state is SuccessImageInstalledState) {
      //       return SingleChildScrollView(
      //         child: Padding(
      //           padding: EdgeInsets.only(left: 80, right: 80),
      //           child: Center(
      //             child: ConstrainedBox(
      //               constraints: BoxConstraints(maxWidth: 700),
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 crossAxisAlignment: CrossAxisAlignment.stretch,
      //                 children: [
      //                   SizedBox(height: 50),
      //                   _buildInputField(
      //                     context: context,
      //                     controller: loginController,
      //                     hintText: "Введите почту",
      //                   ),
      //                   SizedBox(height: 25),
      //                   _buildInputField(
      //                     context: context,
      //                     controller: passwordController,
      //                     hintText: "Введите пароль",
      //                   ),
      //                   SizedBox(height: 25),
      //                   _buildInputField(
      //                     context: context,
      //                     controller: usernameController,
      //                     hintText: "Введите никнейм",
      //                   ),
      //                   SizedBox(height: 25),
      //                   GestureDetector(
      //                     onTap: () => context.read<AuthBloc>().add(
      //                       AuthPickImageEvent(),
      //                     ),
      //                     child: CircleAvatar(
      //                       radius: avatarImagePath != null ? 100 : 50,
      //                       backgroundColor: obsoleteSecondaryColor,
      //                       foregroundImage: avatarImagePath != null
      //                           ? FileImage(File(avatarImagePath!), scale: 200)
      //                           : null,
      //                       child: avatarImagePath == null
      //                           ? Icon(
      //                               Icons.photo_camera_outlined,
      //                               size: 64,
      //                               color: headerTextColor,
      //                             )
      //                           : null,
      //                     ),
      //                   ),
      //                   SizedBox(height: 25),

      //                   ElevatedButton(
      //                     style: ElevatedButton.styleFrom(
      //                       backgroundColor: secondaryHighlightedColor,
      //                       foregroundColor: mainTextColor,
      //                       shape: RoundedRectangleBorder(
      //                         borderRadius: BorderRadius.circular(20),
      //                       ),
      //                       padding: EdgeInsets.symmetric(vertical: 18),
      //                     ),
      //                     onPressed: () => context.read<AuthBloc>().add(
      //                       AuthSignInEvent(
      //                         email: loginController.text,
      //                         password: passwordController.text,
      //                       ),
      //                     ),
      //                     child: Text(
      //                       "Войти",
      //                       style: TextStyle(
      //                         fontSize: 20,
      //                         color: mainTextColor,
      //                         fontWeight: FontWeight.w500,
      //                       ),
      //                     ),
      //                   ),
      //                   SizedBox(height: 20),
      //                   GestureDetector(
      //                     onTap: () => context.read<AuthBloc>().add(
      //                       AuthSignUpEvent(
      //                         email: loginController.text,
      //                         password: passwordController.text,
      //                         username: usernameController.text,
      //                       ),
      //                     ),
      //                     child: Text(
      //                       "Зарегестрироваться (как кнопка)",
      //                       style: TextStyle(color: Colors.green),
      //                     ),
      //                   ),
      //                   SizedBox(height: 20),

      //                   Text(
      //                     "Или с помощью гугла",
      //                     style: TextStyle(color: Colors.lightGreen),
      //                   ),
      //                   IconButton(
      //                     onPressed: () => context.read<AuthBloc>().add(
      //                       AuthGoogleSignInEvent(),
      //                     ),
      //                     icon: Icon(Icons.accessibility_new),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       );
      //     } else {
      //       return Center(
      //         child: CircularProgressIndicator(color: mainHighlightedColor),
      //       );
      //     }
      //   },
      // ),