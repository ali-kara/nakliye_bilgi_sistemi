class Sofor {
  int? soforID;
  String? kodu;
  String? adi;
  String? soyadi;
  String? plaka;
  String? sehir;
  String? bolge;
  String? nakliyeci;

  Sofor({
    this.soforID,
    this.kodu,
    this.adi,
    this.soyadi,
    this.plaka,
    this.sehir,
    this.bolge,
    this.nakliyeci,
  });

  Sofor.fromJson(Map<String, dynamic> json) {
    soforID = json['SoforID'];
    kodu = json['Kodu'];
    adi = json['Adi'];
    soyadi = json['Soyadi'];
    plaka = json['Plaka'];
    sehir = json['Sehir'];
    bolge = json['Bolge'];
    nakliyeci = json['Nakliyeci'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SoforID'] = soforID;
    data['Kodu'] = kodu;
    data['Adi'] = adi;
    data['Soyadi'] = soyadi;
    data['Plaka'] = plaka;
    data['Sehir'] = sehir;
    data['Bolge'] = bolge;
    data['Nakliyeci'] = nakliyeci;
    return data;
  }
}

class soforLogin {
  String? kodu;
  String? parola;

  soforLogin({this.kodu, this.parola});

  soforLogin.fromJson(Map<String, dynamic> json) {
    kodu = json['SoforKodu'];
    parola = json['Parola'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SoforKodu'] = kodu;
    data['Parola'] = parola;
    return data;
  }
}
