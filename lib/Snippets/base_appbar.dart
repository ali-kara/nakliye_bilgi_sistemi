import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nakliye_bilgi_sistemi/Core/navigation/navigation_manager.dart';
import 'package:nakliye_bilgi_sistemi/Screens/settings.dart';

class BaseAppBar extends StatefulWidget
    with NavigatorManager
    implements PreferredSizeWidget {
  final String? title;
  final bool? showSettings;

  const BaseAppBar({super.key, this.title, this.showSettings = true});

  @override
  State<BaseAppBar> createState() => _BaseAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _BaseAppBarState extends State<BaseAppBar> {
  final Color backgroundColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: true,
      title: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        children: [
          //const CircleAvatar(),
          Text(
            'floratediye.com',
            style: GoogleFonts.bungeeInline(
              textStyle: TextStyle(
                letterSpacing: 1,
                color: Colors.orange[900],
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      actions: [
        widget.showSettings != true
            ? const SizedBox()
            : IconButton(
                onPressed: () {
                  widget.navigateToWidget(
                    context,
                    const SettingsScreen(),
                  );
                },
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black87,
                ),
              ),
      ],
    );
  }
}



// leading: const CircleAvatar(
//   backgroundImage: NetworkImage(
//       "https://avatars.githubusercontent.com/u/99508918?s=96&v=4"),
// ),

// Image(
//     image: const AssetImage('assets/images/floratediye.png'),
//     height: preferredSize.height),

//actions: [
// IconButton(
//   onPressed: () {},
//   icon: const Icon(Icons.summarize, color: Colors.black87),
//   // backgroundImage: NetworkImage(
//   //     "https://avatars.githubusercontent.com/u/99508918?s=96&v=4"),
// ),
//],