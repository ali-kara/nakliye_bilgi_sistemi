class Plaka {
  int? plakaId;
  String? plakaAdi;
  String? aciklama;

  Plaka({plakaId, plakaAdi, aciklama});

  Plaka.fromJson(Map<String, dynamic> json) {
    plakaId = json["PlakaId"];
    plakaAdi = json["Plaka"];
    aciklama = json["Aciklama"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PlakaId'] = plakaId;
    data['Plaka'] = plakaAdi;
    data['Aciklama'] = aciklama;
    return data;
  }
}
