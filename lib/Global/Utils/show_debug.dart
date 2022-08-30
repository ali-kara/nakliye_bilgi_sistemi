import 'package:flutter/foundation.dart';

class ShowDebug {
  static print(String? message) {
    if (!kReleaseMode) {
      print(message.toString());
    }
  }

  static printWithObject(String? message, Object o) {
    if (!kReleaseMode) {
      print("$o $message");
    }
  }
}
