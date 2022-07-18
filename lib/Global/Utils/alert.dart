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
