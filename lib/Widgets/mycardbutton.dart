import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_colors.dart';
import 'package:nakliye_bilgi_sistemi/Screens/main_screen.dart';

class MyCardButton extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Widget? navigateWidget;
  const MyCardButton(this.title, this.icon, this.navigateWidget);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => navigateWidget ?? const MainScreen(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: ANA_MENU_BUTONLAR),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 70,
              color: ANA_MENU_BUTONLAR_ICI,
            ),
            Text(
              title.toString(),
              style:
                  const TextStyle(color: ANA_MENU_BUTONLAR_ICI, fontSize: 22),
            )
          ],
        ),
      ),
    );
  }
}
