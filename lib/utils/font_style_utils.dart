import 'package:flutter/material.dart';
import 'color_utils.dart';

/// ------------------------------------------------------------------- ///
/// FONT WEIGHT
class FontWeightClass {
  static const light = FontWeight.w200;
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiB = FontWeight.w600;
  static const bold = FontWeight.w700;
  static const extraB = FontWeight.w800;
  static const black = FontWeight.w900;
}

class FontUtils {
  static const double large = 26;
  static const double veryLarge = 40;
  static const double medLarge = 20;
  static const double medium = 18;
  static const double mediumSmall = 16;
  static const double small = 14;
  static const double verySmall = 12;
}

/// ------------------------------------------------------------------- ///
/// FONT TEXT STYLE

class FontTextStyle {
  static const TextStyle blackRegular =
      TextStyle(color: ColorUtils.black, fontWeight: FontWeight.normal);

  static const TextStyle blackBold =
      TextStyle(color: ColorUtils.black, fontWeight: FontWeight.w700);

  static const TextStyle whiteBold =
      TextStyle(color: ColorUtils.white, fontWeight: FontWeight.w700);
}
