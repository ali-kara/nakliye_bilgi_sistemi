class TombalaInsert {
  String? barkod;
  String? ureticiKodu;
  String? adet;
  String? bolge;
  String? plaka;
  String? soforKodu;

  TombalaInsert({
    this.barkod,
    this.ureticiKodu,
    this.adet,
    this.bolge,
    this.plaka,
    this.soforKodu,
  });

  TombalaInsert.fromJson(Map<String, dynamic> json) {
    barkod = json['barkod'];
    ureticiKodu = json['ureticiKodu'];
    adet = json['adet'];
    bolge = json['bolge'];
    plaka = json['plaka'];
    soforKodu = json['soforKodu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['barkod'] = barkod;
    data['ureticiKodu'] = ureticiKodu;
    data['adet'] = adet;
    data['bolge'] = bolge;
    data['plaka'] = plaka;
    data['soforKodu'] = soforKodu;
    return data;
  }
}
