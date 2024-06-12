class DoctorModel {
  String? fcmToken;
  String? address;
  List? myLabs;
  List? myMedicals;
  String? id;
  String? password;
  String? qualification;
  DateTime? created;
  String? mobileNumber;
  String? about;
  bool? isClinicOpen;
  String? name;
  String? clinicName;
  String? mapAddress;
  List<String>? disease;

  DoctorModel(
      {this.fcmToken,
      this.address,
      this.myLabs,
      this.id,
      this.password,
      this.qualification,
      this.created,
      this.myMedicals,
      this.mobileNumber,
      this.about,
      this.isClinicOpen,
      this.name,
      this.clinicName,
      this.mapAddress,
      this.disease});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    fcmToken = json['fcmToken'];
    address = json['address'];
    myLabs = json['myLabs'];
    myMedicals = json['myMedicals'];
    id = json['id'];
    password = json['password'];
    qualification = json['qualification'];
    created =
        json['created'] == null ? DateTime.now() : json['created'].toDate();
    mobileNumber = json['mobileNumber'];
    about = json['about'];
    isClinicOpen = json['isClinicOpen'];
    name = json['name'];
    mapAddress = json['mapAddress'];
    clinicName = json['clinicName'];
    disease = json['disease'] == null ? [] : json['disease'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fcmToken'] = fcmToken;
    data['address'] = address;

    data['myLabs'] = this.myLabs;

    data['myMedicals'] = this.myMedicals;

    data['id'] = id;
    data['password'] = password;
    data['qualification'] = qualification;
    data['created'] = created;
    data['mobileNumber'] = mobileNumber;
    data['about'] = about;
    data['isClinicOpen'] = isClinicOpen;
    data['name'] = name;
    data['mapAddress'] = mapAddress;
    data['clinicName'] = clinicName;
    data['disease'] = this.disease;
    return data;
  }
}

// class MyLabs {
//   String? password;
//   DateTime? created;
//   String? id;
//   String? fcmToken;
//   String? name;
//   String? mobileNumber;
//   bool? primary;
//
//   MyLabs(
//       {this.password,
//       this.created,
//       this.id,
//       this.fcmToken,
//       this.name,
//       this.primary,
//       this.mobileNumber});
//
//   MyLabs.fromJson(Map<String, dynamic> json) {
//     password = json['password'];
//     created = json['created'].toDate();
//     id = json['id'];
//     fcmToken = json['fcmToken'];
//     name = json['name'];
//     primary = json['primary'];
//     mobileNumber = json['mobileNumber'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['password'] = password;
//     data['created'] = created;
//     data['id'] = id;
//     data['fcmToken'] = fcmToken;
//     data['name'] = name;
//     data['primary'] = primary;
//     data['mobileNumber'] = mobileNumber;
//     return data;
//   }
// }
//
// class MyMedicals {
//   String? password;
//   DateTime? created;
//   String? id;
//   String? fcmToken;
//   String? name;
//   String? mobileNumber;
//   bool? primary;
//
//   MyMedicals(
//       {this.password,
//       this.created,
//       this.id,
//       this.fcmToken,
//       this.name,
//       this.primary,
//       this.mobileNumber});
//
//   MyMedicals.fromJson(Map<String, dynamic> json) {
//     password = json['password'];
//     created = json['created'].toDate();
//     id = json['id'];
//     fcmToken = json['fcmToken'];
//     name = json['name'];
//     mobileNumber = json['mobileNumber'];
//     primary = json['primary'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['password'] = password;
//     data['created'] = created;
//     data['id'] = id;
//     data['fcmToken'] = fcmToken;
//     data['name'] = name;
//     data['mobileNumber'] = mobileNumber;
//     data['primary'] = primary;
//     return data;
//   }
// }
