import 'package:doctor_admin/utils/shared_preference_utils.dart';
import 'package:doctor_admin/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../commonWidget/common_textField.dart';
import '../../utils/color_utils.dart';
import '../../utils/enum_utils.dart';
import '../../utils/font_style_utils.dart';
import '../../utils/validation_utils.dart';
import '../../utils/variable_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 90,
                ),
                const Icon(
                  Icons.medical_information,
                  color: ColorUtils.primaryColor,
                  size: 150,
                ),
                const SizedBox(
                  height: 100,
                ),
                CommonTextField(
                  headingText: 'Name',
                  textEditController: name,
                  textCapitalization: TextCapitalization.sentences,
                  pIcon: Icon(Icons.person),
                  textInputAction: TextInputAction.next,
                  hintText: "Enter Name",
                  validationType: ValidationType.FirstLastName,
                  regularExpression: RegularExpression.alphabetSpacePattern,
                ),
                const SizedBox(
                  height: 30,
                ),
                CommonTextField(
                    headingText: 'Password',
                    textEditController: password,
                    textCapitalization: TextCapitalization.sentences,
                    hintText: 'Enter Password',
                    maxLine: 1,
                    textInputAction: TextInputAction.done,
                    pIcon: const Icon(
                      Icons.lock_outline,
                      color: ColorUtils.grey9E,
                      size: 25,
                    ),
                    validationType: ValidationType.Password,
                    inputLength: 20),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          if (name.text.toString().trim() == 'Admin' &&
                              password.text == 'Admin@123') {
                            name.clear();
                            password.clear();
                            await PreferenceManagerUtils.setLoginExist('Login');
                            Get.offAll(AddDoctorDetailsScreen());
                          } else {
                            Get.snackbar('', 'Name OR Password are Wrong',
                                backgroundColor:
                                    ColorUtils.primaryColor.withOpacity(0.3),
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        }
                      },
                      child: Container(
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
