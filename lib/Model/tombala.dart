class NakliyeTombala {
  int? id;
  String? ureticiKodu;
  String? ureticiAdiSoyadi;
  String? ureticiIli;
  String? soforKodu;
  String? plaka;
  String? bolge;
  int? adet;
  String? birimFiyat;
  String? toplamFiyat;
  String? nakliyeci;
  String? tarih;

  NakliyeTombala(
      {this.id,
      this.ureticiKodu,
      this.ureticiAdiSoyadi,
      this.ureticiIli,
      this.soforKodu,
      this.plaka,
      this.bolge,
      this.adet,
      this.birimFiyat,
      this.toplamFiyat,
      this.nakliyeci,
      this.tarih});

  NakliyeTombala.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    ureticiKodu = json['UreticiKodu'];
    ureticiAdiSoyadi = json['UreticiAdiSoyadi'];
    ureticiIli = json['UreticiIli'];
    soforKodu = json['SoforKodu'];
    plaka = json['Plaka'];
    bolge = json['Bolge'];
    adet = json['Adet'];
    birimFiyat = json['BirimFiyat'];
    toplamFiyat = json['ToplamFiyat'];
    nakliyeci = json['Nakliyeci'];
    tarih = json['Tarih'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UreticiKodu'] = ureticiKodu;
    data['UreticiAdiSoyadi'] = ureticiAdiSoyadi;
    data['UreticiIli'] = ureticiIli;
    data['SoforKodu'] = soforKodu;
    data['Plaka'] = plaka;
    data['Bolge'] = bolge;
    data['Adet'] = adet;
    data['BirimFiyat'] = birimFiyat;
    data['ToplamFiyat'] = toplamFiyat;
    data['Nakliyeci'] = nakliyeci;
    data['Tarih'] = tarih;
    return data;
  }
}
