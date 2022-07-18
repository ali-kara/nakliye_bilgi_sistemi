import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nakliye_bilgi_sistemi/Screens/barcode_scanner.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.transparent;
  final String? title;

  //final AppBar appBar;
  //final List<Widget> widgets;

  const BaseAppBar({Key? key, this.title}) : super(key: key);

  // const BaseAppBar({Key? key, this.title, this.appBar, this.widgets})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      title: Center(
        child: Text('floratediye.com',
            style: GoogleFonts.bungeeInline(
              textStyle: TextStyle(
                color: Colors.orange[900],
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )),
      ),
    );
    // Image(
    //     image: const AssetImage('assets/images/floratediye.png'),
    //     height: preferredSize.height),

/*       actions: widgets,
      actions: [
        const SizedBox(
          width: 50,
        ),
      ],
      actions: [
        IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () {
            if (Platform.isIOS) {
              exit(0);
            } else {
              SystemNavigator.pop();
            }
          },
        ),
      ],
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BarcodeScanner()),
          );
        },
      ), */
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
