import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class MustSignInDialogWidget extends StatelessWidget {
  MustSignInDialogWidget({required this.dialogContext, super.key});

  BuildContext dialogContext;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height / 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Для данного действия необходимо войти в аккаунт"),
              ElevatedButton(
                onPressed: () => context.go("/auth"),
                child: Text("Войти"),
              ),
              ElevatedButton(
                onPressed: () => dialogContext.pop(),
                child: Text("Отменить"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
