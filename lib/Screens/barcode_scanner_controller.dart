import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:nakliye_bilgi_sistemi/Core/navigation/navigation_manager.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_colors.dart';
import 'package:nakliye_bilgi_sistemi/Screens/main_screen.dart';
import 'package:nakliye_bilgi_sistemi/Screens/tombala_listesi.dart';

class BarcodeScannerWithController extends StatefulWidget {
  const BarcodeScannerWithController({Key? key}) : super(key: key);

  @override
  BarcodeScannerWithControllerState createState() =>
      BarcodeScannerWithControllerState();
}

class BarcodeScannerWithControllerState
    extends State<BarcodeScannerWithController>
    with SingleTickerProviderStateMixin, NavigatorManager {
  String? barcode;

  MobileScannerController controller = MobileScannerController(
    torchEnabled: false,
    // formats: [BarcodeFormat.qrCode]
    // facing: CameraFacing.front,
  );

  bool isStarted = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return Stack(
            children: [
              MobileScanner(
                controller: controller,
                //allowDuplicates: true,
                fit: BoxFit.fitWidth,
                onDetect: (barcode) {
                  setState(() {
                    this.barcode = barcode.barcodes.first.rawValue;
                  });
                },
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  color: BACKGROUND_COLOR,
                  height: 200,
                  child: TombalaListesi(
                    showAppBar: false,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: 100,
                  color: BACKGROUND_COLOR,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          navigateToWidgetReplace(
                            context,
                            const MainScreen(),
                          );
                        },
                        color: Colors.black,
                        icon: const Icon(Icons.undo_sharp),
                      ),

                      IconButton(
                        color: Colors.white,
                        icon: ValueListenableBuilder(
                          valueListenable: controller.torchState,
                          builder: (context, state, child) {
                            if (state == null) {
                              return const Icon(
                                Icons.flash_off,
                                color: Colors.black,
                              );
                            }
                            switch (state as TorchState) {
                              case TorchState.off:
                                return const Icon(
                                  Icons.flash_off,
                                  color: Colors.black,
                                );
                              case TorchState.on:
                                return const Icon(
                                  Icons.flash_on,
                                  color: Colors.yellow,
                                );
                            }
                          },
                        ),
                        iconSize: 32.0,
                        onPressed: () => controller.toggleTorch(),
                      ),

                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 200,
                          height: 50,
                          child: FittedBox(
                            child: Text(
                              barcode ?? 'Taranıyor!',
                              overflow: TextOverflow.fade,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                          ),
                        ),
                      ),

                      // Center(
                      //   child: SizedBox(
                      //     width: MediaQuery.of(context).size.width - 200,
                      //     height: 50,
                      //     child: FittedBox(
                      //       child: TextField(
                      //         controller: passwordController,
                      //         decoration: const InputDecoration(
                      //           border: InputBorder.none,
                      //           hintText: 'Parolanız',
                      //           //labelText: "Password"
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      // IconButton(
                      //   color: Colors.white,
                      //   icon: isStarted
                      //       ? const Icon(Icons.stop)
                      //       : const Icon(Icons.play_arrow),
                      //   iconSize: 32.0,
                      //   onPressed: () => setState(() {
                      //     isStarted ? controller.stop() : controller.start();
                      //     isStarted = !isStarted;
                      //   }),
                      // ),
                      // IconButton(
                      //   color: Colors.white,
                      //   icon: ValueListenableBuilder(
                      //     valueListenable: controller.cameraFacingState,
                      //     builder: (context, state, child) {
                      //       if (state == null) {
                      //         return const Icon(Icons.camera_front);
                      //       }
                      //       switch (state as CameraFacing) {
                      //         case CameraFacing.front:
                      //           return const Icon(Icons.camera_front);
                      //         case CameraFacing.back:
                      //           return const Icon(Icons.camera_rear);
                      //       }
                      //     },
                      //   ),
                      //   iconSize: 32.0,
                      //   onPressed: () => controller.switchCamera(),
                      // ),
                      // IconButton(
                      //   color: Colors.white,
                      //   icon: const Icon(Icons.image),
                      //   iconSize: 32.0,
                      //   onPressed: () async {
                      //     final ImagePicker _picker = ImagePicker();
                      //     // Pick an image
                      //     final XFile? image = await _picker.pickImage(
                      //       source: ImageSource.gallery,
                      //     );
                      //     if (image != null) {
                      //       if (await controller.analyzeImage(image.path)) {
                      //         if (!mounted) return;
                      //         ScaffoldMessenger.of(context).showSnackBar(
                      //           const SnackBar(
                      //             content: Text('Barcode found!'),
                      //             backgroundColor: Colors.green,
                      //           ),
                      //         );
                      //       } else {
                      //         if (!mounted) return;
                      //         ScaffoldMessenger.of(context).showSnackBar(
                      //           const SnackBar(
                      //             content: Text('No barcode found!'),
                      //             backgroundColor: Colors.red,
                      //           ),
                      //         );
                      //       }
                      //     }
                      //   },
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
