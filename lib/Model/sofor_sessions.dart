class SoforSessions {
  int? id;
  String? soforKodu;
  String? ip;
  String? deviceId;
  String? deviceModel;
  int? oturumHareket;

  SoforSessions({
    this.id,
    this.soforKodu,
    this.ip,
    this.deviceId,
    this.deviceModel,
    this.oturumHareket,
  });

  SoforSessions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    soforKodu = json['soforKodu'];
    ip = json['ip'];
    deviceId = json['deviceId'];
    deviceModel = json['deviceModel'];
    oturumHareket = json['oturumHareket'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['soforKodu'] = soforKodu;
    data['ip'] = ip;
    data['deviceId'] = deviceId;
    data['deviceModel'] = deviceModel;
    data['oturumHareket'] = oturumHareket;
    return data;
  }
}
