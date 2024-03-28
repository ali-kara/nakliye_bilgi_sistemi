class SystemState {
  int? id;
  String? apiVersion;
  String? description;
  bool? isActive;
  String? activationTime;

  SystemState(
      {this.id,
      this.apiVersion,
      this.description,
      this.isActive,
      this.activationTime});

  SystemState.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    apiVersion = json['apiVersion'];
    description = json['description'];
    isActive = json['isActive'];
    activationTime = json['activationTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['apiVersion'] = apiVersion;
    data['description'] = description;
    data['isActive'] = isActive;
    data['activationTime'] = activationTime;
    return data;
  }
}
