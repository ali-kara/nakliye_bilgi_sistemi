import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_colors.dart';
import 'package:nakliye_bilgi_sistemi/Screens/giris_bilgi.dart';
import 'package:nakliye_bilgi_sistemi/Screens/tombala_listesi.dart';

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({super.key});

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  double pos = 0.3;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GirisBilgi(),
      // bottomNavigationBar: DraggableScrollableSheetExample(),
    );
  }
}

class DraggableScrollableSheetExample extends StatefulWidget {
  DraggableScrollableSheetExample({super.key});

  double sheetPosition = 0.3;

  @override
  State<DraggableScrollableSheetExample> createState() =>
      _DraggableScrollableSheetExampleState();
}

class _DraggableScrollableSheetExampleState
    extends State<DraggableScrollableSheetExample> {
  final _sheetMin = 0.1;
  final _sheetMax = 0.75;
  final double _dragSensitivity = 1000;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: widget.sheetPosition,
      minChildSize: _sheetMin,
      maxChildSize: _sheetMax,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return ColoredBox(
          color: ANA_MENU_BUTONLAR,
          child: Column(
            children: <Widget>[
              Grabber(
                isOnDesktopAndWeb: _isOnDesktopAndWeb,
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    widget.sheetPosition -= details.delta.dy / _dragSensitivity;
                    if (widget.sheetPosition < _sheetMin) {
                      widget.sheetPosition = _sheetMin;
                    }
                    if (widget.sheetPosition > _sheetMax) {
                      widget.sheetPosition = _sheetMax;
                    }
                  });
                },
              ),
              Flexible(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(100),
                      right: Radius.circular(100),
                    ),
                  ),
                  child: TombalaListesi(
                    showAppBar: false,
                  ),

                  // ListView.builder(
                  //   controller: _isOnDesktopAndWeb ? null : scrollController,
                  //   itemCount: 25,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return ListTile(
                  //       title: Text(
                  //         'Item $index',
                  //         style: TextStyle(color: colorScheme.background),
                  //       ),
                  //     );
                  //   },
                  // ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  bool get _isOnDesktopAndWeb {
    // if (kIsWeb) {
    //   return true;
    // }
    // switch (defaultTargetPlatform) {
    //   case TargetPlatform.macOS:
    //   case TargetPlatform.linux:
    //   case TargetPlatform.windows:
    //     return true;
    //   case TargetPlatform.android:
    //   case TargetPlatform.iOS:
    //   case TargetPlatform.fuchsia:
    //     return false;
    // }
    return true;
  }
}

/// A draggable widget that accepts vertical drag gestures
/// and this is only visible on desktop and web platforms.
class Grabber extends StatelessWidget {
  const Grabber({
    super.key,
    required this.onVerticalDragUpdate,
    required this.isOnDesktopAndWeb,
  });

  final ValueChanged<DragUpdateDetails> onVerticalDragUpdate;
  final bool isOnDesktopAndWeb;

  @override
  Widget build(BuildContext context) {
    // if (!isOnDesktopAndWeb) {
    //   return const SizedBox.shrink();
    // }

    return GestureDetector(
      onVerticalDragUpdate: onVerticalDragUpdate,
      child: Container(
        width: double.infinity,
        color: ANA_MENU_BUTONLAR,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            width: 100.0,
            height: 4.0,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(120),
                topRight: Radius.circular(120),
              ),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
