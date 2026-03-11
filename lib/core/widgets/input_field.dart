import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
  });
  
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context)
  {
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
}