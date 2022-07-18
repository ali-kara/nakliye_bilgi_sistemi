class Bolge {
  int? BolgeId;
  String? BolgeAdi;
  String? Aciklama;

  Bolge({bolgeId, bolgeAdi, aciklama});

  Bolge.fromJson(Map<String, dynamic> json) {
    BolgeId = json['BolgeId'];
    BolgeAdi = json['BolgeAdi'];
    Aciklama = json['Aciklama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['BolgeId'] = BolgeId;
    data['BolgeAdi'] = BolgeAdi;
    data['Aciklama'] = Aciklama;
    return data;
  }
}
