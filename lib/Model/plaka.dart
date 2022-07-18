class Plaka {
  int? PlakaId;
  String? PlakaAdi;
  String? Aciklama;

  Plaka({PlakaId, PlakaAdi, Aciklama});

  Plaka.fromJson(Map<String, dynamic> json) {
    PlakaId = json["PlakaId"];
    PlakaAdi = json["Plaka"];
    Aciklama = json["Aciklama"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PlakaId'] = PlakaId;
    data['Plaka'] = PlakaAdi;
    data['Aciklama'] = Aciklama;
    return data;
  }
}
