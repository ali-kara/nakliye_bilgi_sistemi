import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:nakliye_bilgi_sistemi/Api/tombala_service.dart';
import 'package:nakliye_bilgi_sistemi/Core/navigation/navigation_manager.dart';
import 'package:nakliye_bilgi_sistemi/Global/Utils/user_messages.dart';
import 'package:nakliye_bilgi_sistemi/Screens/bottom_sheet.dart';
import 'package:nakliye_bilgi_sistemi/ViewModels/tombala_insert.dart';

class BarcodeScannerWithController extends StatefulWidget {
  const BarcodeScannerWithController({super.key});

  @override
  BarcodeScannerWithControllerState createState() =>
      BarcodeScannerWithControllerState();
}

class BarcodeScannerWithControllerState
    extends State<BarcodeScannerWithController>
    with SingleTickerProviderStateMixin, NavigatorManager {
  String? barcode;
  late TombalaService service;

  @override
  void initState() {
    super.initState();

    service = TombalaService();
  }

  MobileScannerController controller = MobileScannerController(
    torchEnabled: false,
    // formats: [BarcodeFormat.qrCode]
    // facing: CameraFacing.front,
  );

  bool isStarted = true;

  Future<void> _insert(String barkod) async {
    TombalaInsert tombalaInsert = TombalaInsert(
        adet: "1",
        ureticiKodu: "",
        bolge: "İZMİR",
        plaka: "06CFM475",
        soforKodu: "ANKİBO",
        barkod: barkod);

    /*
    Barkodda
İlk 5 hane FLORA
6. karakter - 
7 tür (1,0)
8 karakter - 
9,10,11,12 karakter üretici kodu */

    var response = await service.insert(tombalaInsert, context);
    if (!mounted) return;
    if (response) {
      showSnackbarSuccess(context, "$barkod Başarılı");
    } else {
      showSnackbarError(context, "Hata");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DraggableScrollableSheetExample(),
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
                    if (this.barcode != barcode.barcodes.first.rawValue) {
                      showSnackbarSuccess(
                          context, barcode.barcodes.first.rawValue);

                      _insert(barcode.barcodes.first.rawValue.toString());
                    }
                    this.barcode = barcode.barcodes.first.rawValue;
                  });
                },
              ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   // child: Container(
              //   //   color: BACKGROUND_COLOR,
              //   //   height: 200,
              //   //   child: TombalaListesi(
              //   //     showAppBar: false,
              //   //   ),
              //   // ),
              //   child: DraggableScrollableSheetExample(),
              // ),
              //   Align(
              //     alignment: Alignment.topCenter,
              //     child: Container(
              //       alignment: Alignment.topCenter,
              //       height: 75,
              //       color: BACKGROUND_COLOR,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           IconButton(
              //             onPressed: () {
              //               navigateToWidgetReplace(
              //                 context,
              //                 const MainScreen(),
              //               );
              //             },
              //             color: Colors.black,
              //             icon: const Icon(Icons.undo_sharp),
              //           ),

              //           IconButton(
              //             color: Colors.white,
              //             icon: ValueListenableBuilder(
              //               valueListenable: controller.torchState,
              //               builder: (context, state, child) {
              //                 switch (state) {
              //                   case TorchState.off:
              //                     return const Icon(
              //                       Icons.flash_off,
              //                       color: Colors.black,
              //                     );
              //                   case TorchState.on:
              //                     return const Icon(
              //                       Icons.flash_on,
              //                       color: Colors.yellow,
              //                     );
              //                 }
              //               },
              //             ),
              //             iconSize: 32.0,
              //             onPressed: () => controller.toggleTorch(),
              //           ),

              //           Center(
              //             child: SizedBox(
              //               width: MediaQuery.of(context).size.width - 200,
              //               height: 50,
              //               child: FittedBox(
              //                 child: Text(
              //                   barcode ?? 'Taranıyor!',
              //                   overflow: TextOverflow.fade,
              //                   style: Theme.of(context)
              //                       .textTheme
              //                       .displayMedium!
              //                       .copyWith(
              //                         color: Colors.black,
              //                       ),
              //                 ),
              //               ),
              //             ),
              //           ),

              //           // Center(
              //           //   child: SizedBox(
              //           //     width: MediaQuery.of(context).size.width - 200,
              //           //     height: 50,
              //           //     child: FittedBox(
              //           //       child: TextField(
              //           //         controller: passwordController,
              //           //         decoration: const InputDecoration(
              //           //           border: InputBorder.none,
              //           //           hintText: 'Parolanız',
              //           //           //labelText: "Password"
              //           //         ),
              //           //       ),
              //           //     ),
              //           //   ),
              //           // ),

              //           // IconButton(
              //           //   color: Colors.white,
              //           //   icon: isStarted
              //           //       ? const Icon(Icons.stop)
              //           //       : const Icon(Icons.play_arrow),
              //           //   iconSize: 32.0,
              //           //   onPressed: () => setState(() {
              //           //     isStarted ? controller.stop() : controller.start();
              //           //     isStarted = !isStarted;
              //           //   }),
              //           // ),
              //           // IconButton(
              //           //   color: Colors.white,
              //           //   icon: ValueListenableBuilder(
              //           //     valueListenable: controller.cameraFacingState,
              //           //     builder: (context, state, child) {
              //           //       if (state == null) {
              //           //         return const Icon(Icons.camera_front);
              //           //       }
              //           //       switch (state as CameraFacing) {
              //           //         case CameraFacing.front:
              //           //           return const Icon(Icons.camera_front);
              //           //         case CameraFacing.back:
              //           //           return const Icon(Icons.camera_rear);
              //           //       }
              //           //     },
              //           //   ),
              //           //   iconSize: 32.0,
              //           //   onPressed: () => controller.switchCamera(),
              //           // ),
              //           // IconButton(
              //           //   color: Colors.white,
              //           //   icon: const Icon(Icons.image),
              //           //   iconSize: 32.0,
              //           //   onPressed: () async {
              //           //     final ImagePicker _picker = ImagePicker();
              //           //     // Pick an image
              //           //     final XFile? image = await _picker.pickImage(
              //           //       source: ImageSource.gallery,
              //           //     );
              //           //     if (image != null) {
              //           //       if (await controller.analyzeImage(image.path)) {
              //           //         if (!mounted) return;
              //           //         ScaffoldMessenger.of(context).showSnackBar(
              //           //           const SnackBar(
              //           //             content: Text('Barcode found!'),
              //           //             backgroundColor: Colors.green,
              //           //           ),
              //           //         );
              //           //       } else {
              //           //         if (!mounted) return;
              //           //         ScaffoldMessenger.of(context).showSnackBar(
              //           //           const SnackBar(
              //           //             content: Text('No barcode found!'),
              //           //             backgroundColor: Colors.red,
              //           //           ),
              //           //         );
              //           //       }
              //           //     }
              //           //   },
              //           // ),
              //         ],
              //       ),
              //     ),
              //   ),
            ],
          );
        },
      ),
    );
  }
}
