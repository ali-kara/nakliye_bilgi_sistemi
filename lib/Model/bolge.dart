class Bolge {
  int? bolgeId;
  String? bolgeAdi;
  String? aciklama;

  Bolge({this.bolgeId, this.bolgeAdi, this.aciklama});

  Bolge.fromJson(Map<String, dynamic> json) {
    bolgeId = json['bolgeId'];
    bolgeAdi = json['bolgeAdi'];
    aciklama = json['aciklama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bolgeId'] = bolgeId;
    data['bolgeAdi'] = bolgeAdi;
    data['aciklama'] = aciklama;
    return data;
  }
}
