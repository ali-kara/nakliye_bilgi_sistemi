import 'package:flutter/material.dart';

void alert(BuildContext context, String displayText) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(displayText),
      );
    },
  );
}

void _showSnackbar(context, color, message) {
  ScaffoldMessenger.of(context).clearSnackBars();

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 14),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {
          //showSnackbar(context, color, "sadasd");
        },
        textColor: Colors.white,
      ),
    ),
  );
}

void showSnackbarSuccess(context, message) {
  _showSnackbar(context, Colors.green, message);
}

void showSnackbarError(context, message) {
  _showSnackbar(context, Colors.red, message);
}
