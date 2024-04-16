class TombalaGet {
  String? bolge;
  String? plaka;
  String? soforKodu;

  TombalaGet({
    this.bolge,
    this.plaka,
    this.soforKodu,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bolge'] = bolge;
    data['plaka'] = plaka;
    data['soforKodu'] = soforKodu;
    return data;
  }
}
