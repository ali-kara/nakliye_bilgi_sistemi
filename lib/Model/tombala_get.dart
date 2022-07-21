class TombalaGet {
  String? bolge;
  String? plaka;
  String? soforKodu;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Bolge'] = bolge;
    data['Plaka'] = plaka;
    data['Sofor_Kodu'] = soforKodu;
    return data;
  }
}
