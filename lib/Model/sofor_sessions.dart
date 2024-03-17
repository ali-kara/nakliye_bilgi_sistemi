class SoforSessions {
  int? id;
  String? soforKodu;
  String? ip;
  String? deviceId;
  String? deviceModel;
  int? oturumHareket;

  SoforSessions(
      {this.id,
      this.soforKodu,
      this.ip,
      this.deviceId,
      this.deviceModel,
      this.oturumHareket});

  SoforSessions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    soforKodu = json['soforKodu'];
    ip = json['ip'];
    deviceId = json['deviceId'];
    deviceModel = json['deviceModel'];
    oturumHareket = json['oturumHareket'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['soforKodu'] = this.soforKodu;
    data['ip'] = this.ip;
    data['deviceId'] = this.deviceId;
    data['deviceModel'] = this.deviceModel;
    data['oturumHareket'] = this.oturumHareket;
    return data;
  }
}
