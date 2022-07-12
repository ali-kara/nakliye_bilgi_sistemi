import 'package:http/http.dart';

class Plaka {
  late int PlakaId;
  late String PlakaAdi;
  late String Aciklama;

  Plaka(
    this.PlakaId,
    this.PlakaAdi,
    this.Aciklama,
  );

  Plaka.fromJson(Map<String, dynamic> response) {
    PlakaId = response['PlakaId'];
    PlakaAdi = response['PlakaAdi'];
    Aciklama = response['Aciklama'];
  }
}
