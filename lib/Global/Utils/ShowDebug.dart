// ignore_for_file: file_names

import 'package:flutter/foundation.dart';

class ShowDebug {
  static print(Object o) {
    if (!kReleaseMode) {
      print(o.toString());
    }
  }
}
