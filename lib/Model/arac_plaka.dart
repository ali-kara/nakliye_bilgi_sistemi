class AracPlaka {
  int? plakaId;
  String? plaka;
  String? aciklama;

  AracPlaka({this.plakaId, this.plaka, this.aciklama});

  AracPlaka.fromJson(Map<String, dynamic> json) {
    plakaId = json['plakaId'];
    plaka = json['plaka'];
    aciklama = json['aciklama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['plakaId'] = plakaId;
    data['plaka'] = plaka;
    data['aciklama'] = aciklama;

    return data;
  }
}
