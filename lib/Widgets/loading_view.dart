import 'package:flutter/material.dart';

Widget loadingWidget() {
  return const Center(
    child: FittedBox(
      child: CircularProgressIndicator.adaptive(),
    ),
  );
}
