import 'package:flutter/material.dart';

void createSnackBar(BuildContext context, String message) {
  final snackbar = SnackBar(content: Text(message));

  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
