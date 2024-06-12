import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_admin/utils/color_utils.dart';
import 'package:doctor_admin/utils/font_style_utils.dart';
import 'package:doctor_admin/utils/shared_preference_utils.dart';
import 'package:doctor_admin/utils/size_config_utils.dart';
import 'package:doctor_admin/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../commonWidget/common_textField.dart';
import '../../modal/doctor_model.dart';
import '../../modal/medical_detail_model.dart';
import '../../service/auth_service.dart';
import '../../utils/enum_utils.dart';
import '../../utils/loading_dialog.dart';
import '../../utils/validation_utils.dart';

class AddDoctorDetailsScreen extends StatefulWidget {
  const AddDoctorDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AddDoctorDetailsScreen> createState() => _AddDoctorDetailsScreenState();
}

class _AddDoctorDetailsScreenState extends State<AddDoctorDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController doctorName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController clinicName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController qualification = TextEditingController();
  TextEditingController about = TextEditingController();
  TextEditingController mapLink = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizeConfig.sH02,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizeConfig.sW05,
                  Text(
                    'Add Doctor Details',
                    style: FontTextStyle.blackBold.copyWith(
                        fontSize: FontUtils.medLarge,
                        color: ColorUtils.primaryColor),
                  ),
                  InkWell(
                      onTap: () async {
                        await PreferenceManagerUtils.clearPreference();
                        Get.offAll(LoginScreen());
                      },
                      child: const Icon(
                        Icons.logout,
                        color: ColorUtils.grey9E,
                      ))
                ],
              ),
            ),
            SizeConfig.sH05,
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        /// name
                        CommonTextField(
                          headingText: 'Name',
                          textEditController: doctorName,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.next,
                          hintText: "Enter Name",
                          validationType: ValidationType.FirstLastName,
                          textInputType: TextInputType.text,
                          regularExpression:
                              RegularExpression.alphabetSpacePattern,
                        ),
                        SizeConfig.sH02,

                        /// mobile number
                        CommonTextField(
                          headingText: 'Mobile',
                          hintText: 'Enter Mobile Number',
                          validationType: ValidationType.PNumber,
                          textInputType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          isValidate: true,
                          inputLength: 10,
                          textEditController: mobileNumber,
                          regularExpression: RegularExpression.digitsPattern,
                        ),
                        SizeConfig.sH02,

                        /// password
                        CommonTextField(
                            headingText: 'Password',
                            textEditController: password,
                            textCapitalization: TextCapitalization.sentences,
                            hintText: 'Enter Password',
                            maxLine: 1,
                            isValidate: true,
                            textInputType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            validationType: ValidationType.Password,
                            inputLength: 20),
                        SizeConfig.sH02,

                        /// address
                        CommonTextField(
                          validationType: ValidationType.FirstLastName,
                          textInputType: TextInputType.text,
                          isValidate: true,
                          textInputAction: TextInputAction.next,
                          textEditController: address,
                          hintText: "Enter Address",
                          headingText: 'Address',
                        ),
                        SizeConfig.sH02,

                        /// clinic name
                        CommonTextField(
                          headingText: 'Clinic Name',
                          textEditController: clinicName,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.next,
                          hintText: "Enter Clinic Name",
                          validationType: ValidationType.FirstLastName,
                          textInputType: TextInputType.text,
                        ),
                        SizeConfig.sH02,

                        /// qualification
                        CommonTextField(
                          headingText: 'Qualification',
                          textEditController: qualification,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.next,
                          hintText: "Enter Qualification",
                          validationType: ValidationType.FirstLastName,
                          textInputType: TextInputType.text,
                          regularExpression:
                              RegularExpression.alphabetSpacePattern,
                        ),
                        SizeConfig.sH02,

                        /// about
                        CommonTextField(
                          headingText: 'About',
                          textEditController: about,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.next,
                          hintText: "About",
                          validationType: ValidationType.FirstLastName,
                          textInputType: TextInputType.text,
                        ),
                        SizeConfig.sH02,

                        /// map address
                        CommonTextField(
                          headingText: 'Map Address',
                          textEditController: mapLink,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.done,
                          hintText: "Enter Map Link",
                          validationType: ValidationType.FirstLastName,
                          textInputType: TextInputType.text,
                        ),
                        SizeConfig.sH02,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                FocusScope.of(context).unfocus();
                if (_formKey.currentState!.validate()) {
                  DoctorModel model = DoctorModel();
                  model.about = about.text;
                  model.address = address.text;
                  model.clinicName = clinicName.text;
                  model.created = DateTime.now();
                  model.disease = [];
                  model.fcmToken = "";
                  model.id = mobileNumber.text;
                  model.isClinicOpen = false;
                  model.mapAddress = mapLink.text;
                  model.mobileNumber = mobileNumber.text;
                  model.myLabs = [];
                  model.myMedicals = [];
                  model.name = doctorName.text;
                  model.password = password.text;
                  model.qualification = qualification.text;
                  showLoadingDialog(context: context);
                  final status = await addDoctor(model: model);
                  if (status) {
                    MedicalModel model = MedicalModel();

                    model.mobileNumber = mobileNumber.text;
                    model.name = clinicName.text;
                    model.fcmToken = "";
                    model.password = password.text;
                    model.created = DateTime.now();
                    final checkUserExistStatus =
                        await AuthService.checkUserExistForMedical(
                            model.mobileNumber!);

                    if (checkUserExistStatus == false) {
                      await AuthService.medicalSignUp(model);
                    }
                    const SnackBar(
                      content: Text('Data Add Successfully'),
                    );
                    mapLink.clear();
                    about.clear();
                    qualification.clear();
                    password.clear();
                    clinicName.clear();
                    address.clear();
                    mobileNumber.clear();
                    doctorName.clear();
                    hideLoadingDialog(context: context);
                  } else {
                    hideLoadingDialog(context: context);
                    const SnackBar(
                      content: Text('Error'),
                    );

                    /// SOMETHING WENT WRONG
                  }
                }
              },
              child: Padding(
                padding: EdgeInsets.all(5.w),
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [
                          ColorUtils.commonButtonBg1,
                          ColorUtils.commonButtonBg2
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: FontTextStyle.whiteBold
                            .copyWith(fontSize: FontUtils.small),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Future<bool> addDoctor({required DoctorModel model}) async {
    return FirebaseFirestore.instance
        .collection('Doctor')
        .doc(model.mobileNumber)
        .set(model.toJson())
        .then((value) => true)
        .catchError((e) {
      print('SIGN UP ERROR :=>$e');
      return false;
    });
  }
}
