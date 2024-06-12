import 'dart:io';
import 'package:doctor_admin/utils/shared_preference_utils.dart';
import 'package:doctor_admin/view/auth/login_screen.dart';
import 'package:doctor_admin/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    print('getLogin==+${PreferenceManagerUtils.getLoginExist()}');
    Future.delayed(const Duration(seconds: 3), () async {
      PreferenceManagerUtils.getLoginExist() == 'Login'
          ? Get.off(() => const AddDoctorDetailsScreen(),
              transition: Transition.cupertino)
          : Get.off(() => const LoginScreen(),
              transition: Transition.cupertino);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.light,
      ),
      child: Material(
          color: Colors.white,
          child: Center(child: Image.asset('assets/splash.gif'))),
    );
  }
}
