import 'package:flutter/material.dart';

class ApplicationDialog extends StatelessWidget {
  ApplicationDialog({
    super.key,
    required this.onLeft,
    required this.onRight,
    required this.dialogTitle,
    required this.leftTextButton,
    required this.rightTextButton,
  });
  VoidCallback onLeft, onRight;
  String leftTextButton, rightTextButton, dialogTitle;

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
              Text(dialogTitle),
              ElevatedButton(
                onPressed: () => onLeft.call(),
                child: Text(leftTextButton),
              ),
              ElevatedButton(
                onPressed: () => onRight.call(),
                child: Text(rightTextButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
