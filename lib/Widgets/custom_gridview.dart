import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Screens/barcode_scanner.dart';
import 'package:nakliye_bilgi_sistemi/Screens/giris_bilgi.dart';
import 'package:nakliye_bilgi_sistemi/Widgets/mycardbutton.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true, // ortalamayı saglıyor
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: const [
        MyCardButton('Barkod İşlemleri', Icons.qr_code, BarcodeScanner()),
        MyCardButton('Bilgilerim', Icons.info, GirisBilgi()),
      ],
    );
  }
}
