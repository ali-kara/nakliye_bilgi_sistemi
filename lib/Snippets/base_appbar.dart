import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nakliye_bilgi_sistemi/Screens/home_screen.dart';
import 'package:nakliye_bilgi_sistemi/Screens/settings.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.white;
  final String? title;

  //final AppBar appBar;
  //final List<Widget> widgets;

  /// you can add more fields that meet your needs

  const BaseAppBar({Key? key, this.title}) : super(key: key);

  // const BaseAppBar({Key? key, this.title, this.appBar, this.widgets})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
          child: Image(
              image: const AssetImage('assets/images/floratediye.png'),
              height: preferredSize.height)),
      backgroundColor: backgroundColor,
      elevation: 0,
      //actions: widgets,
      actions: [
        IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else {
                if (Platform.isIOS) {
                  exit(0);
                }
              }
            }),
      ],      
      leading:       
      IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Settings()));
        },
      )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
