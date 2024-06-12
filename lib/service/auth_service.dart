import 'package:cloud_firestore/cloud_firestore.dart';

import '../modal/medical_detail_model.dart';

class AuthService {
  static Future<bool> checkUserExistForMedical(String docId) async {
    return FirebaseFirestore.instance
        .collection('Medical')
        .doc(docId)
        .get()
        .then((value) => value.exists ? true : false)
        .catchError((e) {
      print('CHECK USER EXIST ERROR:=>$e');
      return false;
    });
  }

  static Future<bool> medicalSignUp(MedicalModel model) async {
    return FirebaseFirestore.instance
        .collection('Medical')
        .doc(model.mobileNumber)
        .set(model.toJson())
        .then((value) => true)
        .catchError((e) {
      print('SIGN UP ERROR :=>$e');
      return false;
    });
  }
}
