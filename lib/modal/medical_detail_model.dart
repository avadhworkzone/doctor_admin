class MedicalModel {
  String? id;
  String? name;
  String? password;
  String? mobileNumber;
  String? fcmToken;
  DateTime? created;

  MedicalModel({
    this.password,
    this.fcmToken,
    this.id,
    this.name,
    this.mobileNumber,
    this.created,
  });

  MedicalModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    password = json['password'] ?? "";
    mobileNumber = json['mobileNumber'] ?? "";
    fcmToken = json['fcmToken'] ?? "";
    created = json['created'].toDate() ?? "";
  }

  Map<String, dynamic> toJson() => {
        'id': mobileNumber,
        'name': name,
        'password': password,
        'mobileNumber': mobileNumber,
        'fcmToken': fcmToken,
        'created': created,
      };
}
