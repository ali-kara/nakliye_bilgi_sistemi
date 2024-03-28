class AppVersion {
  int? id;
  String? version;
  String? description;
  bool? isForcedUpdate;
  int? platform;

  AppVersion(
      {this.id,
      this.version,
      this.description,
      this.isForcedUpdate,
      this.platform});

  AppVersion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    version = json['version'];
    description = json['description'];
    isForcedUpdate = json['isForcedUpdate'];
    platform = json['platform'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['version'] = version;
    data['description'] = description;
    data['isForcedUpdate'] = isForcedUpdate;
    data['platform'] = platform;
    return data;
  }
}
