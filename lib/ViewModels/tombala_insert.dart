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
    barkod = json['Barkod'];
    ureticiKodu = json['UreticiKodu'];
    adet = json['Adet'];
    bolge = json['Bolge'];
    plaka = json['Plaka'];
    soforKodu = json['Sofor_Kodu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Barkod'] = barkod;
    data['UreticiKodu'] = ureticiKodu;
    data['Adet'] = adet;
    data['Bolge'] = bolge;
    data['Plaka'] = plaka;
    data['Sofor_Kodu'] = soforKodu;
    return data;
  }
}
