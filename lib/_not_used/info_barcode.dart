// import 'dart:async';
// import 'dart:ui' as ui;

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:qr_flutter/qr_flutter.dart';

// class InfoBarcode extends StatefulWidget {
//   const InfoBarcode({Key? key}) : super(key: key);

//   @override
//   State<InfoBarcode> createState() => _BarcodeScannerState();
// }

// class _BarcodeScannerState extends State<InfoBarcode> {
//   @override
//   Widget build(BuildContext context) {
//     const message = 'www.floratediye.com';

//     final qrFutureBuilder = FutureBuilder<ui.Image>(
//       future: _loadOverlayImage(),
//       builder: (ctx, snapshot) {
//         const size = 280.0;
//         if (!snapshot.hasData) {
//           return Container(width: size, height: size);
//         }
//         return CustomPaint(
//           size: const Size.square(size),
//           painter: QrPainter(
//             data: message,
//             version: QrVersions.auto,
//             eyeStyle: const QrEyeStyle(
//               eyeShape: QrEyeShape.square,
//               color: Colors.lightGreen,
//             ),
//             dataModuleStyle: const QrDataModuleStyle(
//               dataModuleShape: QrDataModuleShape.circle,
//               color: ui.Color.fromARGB(255, 0, 0, 0),
//             ),
//             // size: 320.0,
//             embeddedImage: snapshot.data,
//             embeddedImageStyle: QrEmbeddedImageStyle(
//               size: const Size.square(60),
//             ),
//           ),
//         );
//       },
//     );

//     return Material(
//       color: Colors.white,
//       child: SafeArea(
//         top: true,
//         bottom: true,
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               child: Center(
//                 child: Container(
//                   width: 280,
//                   child: qrFutureBuilder,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40)
//                   .copyWith(bottom: 40),
//               child: const Text(message),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<ui.Image> _loadOverlayImage() async {
//     final completer = Completer<ui.Image>();
//     final byteData = await rootBundle.load('assets/images/logo.png');
//     ui.decodeImageFromList(byteData.buffer.asUint8List(), completer.complete);
//     return completer.future;
//   }
// }
