import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void showLoadingDialog({
  @required BuildContext? context,
  Color? barrierColor,
}) {
  Future.delayed(Duration(seconds: 0), () {
    showDialog(
        context: context!,
// barrierColor: barrierColor ?? AppColors.textColorWhite.withOpacity(0.50),
        barrierDismissible: false,
        builder: (context) {
          return Center(
              child: Lottie.asset('assets/commonLoader.json', height: 100));
        });
  });
}

void hideLoadingDialog({BuildContext? context}) {
  Navigator.pop(context!, false);
}
