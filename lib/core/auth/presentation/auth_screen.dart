import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skenteas/core/widgets/input_field.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

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
                    "Авторизация",
                    style: TextStyle(
                      fontFamily: 'MisterBrush',
                      fontSize: 40,
                      color: colorTheme.primaryColorDark,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 45),
                  InputField(
                    controller: TextEditingController(),
                    hintText: 'Введите почту',
                  ),
                  const SizedBox(height: 20),
                  InputField(
                    controller: TextEditingController(),
                    hintText: 'Введите пароль',
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Забыли пароль?",
                    style: TextStyle(
                      fontFamily: 'MisterBrush',
                      fontSize: 15,
                      color: Colors.black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 15),
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
                            "Войти",
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
                  const SizedBox(height: 20),
                  Text(
                    "Или войдите через:",
                    style: TextStyle(
                      fontFamily: 'MisterBrush',
                      fontSize: 15,
                      color: colorTheme.highlightColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
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
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ещё нет аккаунта?",
                        style: TextStyle(
                          fontFamily: 'MisterBrush',
                          fontSize: 15,
                          color: colorTheme.highlightColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 40),
                      Text(
                        "Зарегистрироваться",
                        style: TextStyle(
                          fontFamily: 'MisterBrush',
                          fontSize: 15,
                          color: Colors.black,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
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