class SoforLogin {
  String? kodu;
  String? parola;

  SoforLogin({this.kodu, this.parola});

  SoforLogin.fromJson(Map<String, dynamic> json) {
    kodu = json['SoforKodu'];
    parola = json['Parola'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SoforKodu'] = kodu;
    data['Parola'] = parola;
    return data;
  }
}
