import 'dart:ffi';

class Bolge {
  late Int BolgeId;
  late String BolgeAdi;
  late String Aciklama;

  Bolge(this.BolgeId, this.BolgeAdi, this.Aciklama);

  Bolge.fromJson(Map<String, dynamic> response) {
    BolgeId = response['BolgeId'];
    BolgeAdi = response['BolgeAdi'];
    Aciklama = response['Aciklama'];
  }
}
