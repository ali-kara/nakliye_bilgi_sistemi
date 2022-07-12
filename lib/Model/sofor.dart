// ignore_for_file: non_constant_identifier_names
class Sofor {
  final int SoforID;
  final String Kodu;
  final String Adi;
  final String Soyadi;
  final String? Plaka;
  final String? Sehir;
  final String? Bolge;
  final String Parola;
  final String? Nakliyeci;

  Sofor(this.SoforID, this.Kodu, this.Adi, this.Soyadi, this.Plaka, this.Sehir,
      this.Parola, this.Nakliyeci, this.Bolge);
}

class SoforLogin {
  final String Kodu;
  final String Parola;

  SoforLogin(this.Kodu, this.Parola);
}
