import 'package:flutter/material.dart';

mixin NavigatorManager {
  void navigateToWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return widget;
        },
        //fullscreenDialog: true,
        settings: const RouteSettings(),
      ),
    );
  }

  Future<T?> navigateToWidgetNormal<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(
        builder: (context) {
          return widget;
        },
        settings: const RouteSettings(),
      ),
    );
  }

  void navigateToWidgetReplace(BuildContext context, Widget widget) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return widget;
        },
        settings: const RouteSettings(),
      ),
    );
  }

  void backToPreviousPage(BuildContext context) {
    Navigator.of(context).pop();
  }
}
