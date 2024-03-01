import 'package:flutter/material.dart';

Widget loadingWidget() {
  return const FittedBox(
    child: CircularProgressIndicator.adaptive(),
  );
}
