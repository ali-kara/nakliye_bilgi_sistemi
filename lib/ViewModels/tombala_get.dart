class TombalaGet {
  String? bolge;
  String? plaka;
  String? sofor_Kodu;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Bolge'] = bolge;
    data['Plaka'] = plaka;
    data['Sofor_Kodu'] = sofor_Kodu;
    return data;
  }
}
