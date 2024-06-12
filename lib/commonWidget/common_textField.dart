import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import '../utils/color_utils.dart';
import '../utils/enum_utils.dart';
import '../utils/font_style_utils.dart';
import '../utils/typedef_utils.dart';
import '../utils/validation_utils.dart';

class CommonTextField extends StatefulWidget {
  final String? titleText;
  final bool? isValidate;
  final bool? readOnly;
  final TextInputType? textInputType;
  final ValidationType? validationType;
  final String? regularExpression;
  final int? inputLength;
  final String? hintText;
  final String? validationMessage;
  final int? maxLine;
  Widget? sIcon;
  Widget? pIcon;
  TextInputAction? textInputAction;
  final bool? obscureValue;
  final bool? withOutIcon;
  final double? containerHeight;
  final Color? containerBgColor;
  final TextStyle? hintStyle;
  final TextEditingController? textEditController;
  final Function? onTap;
  final Function(String)? onChange;
  String? headingText;
  final bool? isAddress;
  final TextCapitalization? textCapitalization;
  final bool? useRegularExpression;
  final bool? prefix;
  final Color? borderColor;
  final TextStyle? style;
  final String? prefixText;
  CommonTextField(
      {Key? key,
      this.titleText,
      this.isValidate,
      this.containerHeight,
      this.textInputType,
      this.withOutIcon,
      this.validationType,
      this.hintStyle,
      this.regularExpression = '',
      this.inputLength,
      this.readOnly = false,
      this.hintText,
      this.validationMessage,
      this.headingText,
      this.maxLine,
      this.sIcon,
      this.textInputAction,
      this.containerBgColor,
      this.obscureValue,
      this.onChange,
      this.pIcon,
      this.textEditController,
      this.onTap,
      this.isAddress,
      this.textCapitalization,
      this.useRegularExpression,
      this.borderColor,
      this.style,
      this.prefix,
      this.prefixText})
      : super(key: key);

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            widget.headingText!,
            style:
                FontTextStyle.blackRegular.copyWith(color: ColorUtils.grey9E),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorUtils.white,
              boxShadow: [
                BoxShadow(
                    color: ColorUtils.grey9E.withOpacity(0.5),
                    blurRadius: 5,
                    offset: const Offset(0, 0))
              ]),
          child: TextFormField(
            style: const TextStyle(decoration: TextDecoration.none),
            textInputAction: widget.textInputAction,
            onTap: () {},
            onChanged: widget.onChange,
            readOnly: widget.readOnly ?? false,
            controller: widget.textEditController,
            cursorColor: ColorUtils.primaryColor,
            maxLines: widget.maxLine ?? 1,

            validator: (value) {
              return widget.isValidate == false
                  ? null
                  : widget.validationType == ValidationType.Email
                      ? ValidationMethod.validateUserName(value)
                      : widget.validationType == ValidationType.Password
                          ? ValidationMethod.validatePassword(value)
                          : widget.validationType == ValidationType.PNumber
                              ? ValidationMethod.validatePhoneNo(value)
                              : widget.validationType == ValidationType.IfscCode
                                  ? ValidationMethod.ifscCode(value)
                                  : widget.validationType ==
                                          ValidationType.Account
                                      ? ValidationMethod.account(value)
                                      : widget.validationType ==
                                              ValidationType.bankName
                                          ? ValidationMethod.bankAndBranchName(
                                              value)
                                          : widget.validationType ==
                                                  ValidationType.Link
                                              ? ValidationMethod.validateLink(
                                                  value)
                                              : widget.validationType ==
                                                      ValidationType
                                                          .FirstLastName
                                                  ? ValidationMethod
                                                      .firstLastName(value)
                                                  : ValidationMethod
                                                      .validateIsRequired(
                                                          value);
            },

            textCapitalization: widget.textCapitalization == null
                ? TextCapitalization.none
                : widget.textCapitalization!,

            // onChanged: widget.onChange,i

            inputFormatters: widget.regularExpression!.isEmpty
                ? [
                    LengthLimitingTextInputFormatter(widget.inputLength),
                    NoLeadingSpaceFormatter()
                  ]
                : [
                    LengthLimitingTextInputFormatter(widget.inputLength),
                    FilteringTextInputFormatter.allow(RegExp(
                        widget.regularExpression ??
                            RegularExpression.alphabetDigitSpacePattern_)),
                    NoLeadingSpaceFormatter()
                  ],
            keyboardType: widget.textInputType,

            obscuringCharacter: '*',
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              prefixIcon: widget.pIcon,
              suffixIcon: widget.sIcon,
              border: InputBorder.none,
              hintStyle: FontTextStyle.blackRegular
                  .copyWith(color: ColorUtils.grey9E.withOpacity(0.5)),
              hintText: widget.hintText,
            ),
          ),
        ),
      ],
    );
  }
}

class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.startsWith(' ')) {
      final String trimedText = newValue.text.trimLeft();

      return TextEditingValue(
        text: trimedText,
        selection: TextSelection(
          baseOffset: trimedText.length,
          extentOffset: trimedText.length,
        ),
      );
    }

    return newValue;
  }
}
// Widget commonTextField(
//     {String? hint,
//     Validator? validator,
//     OnChange? onChange,
//     TextInputType? keyType,
//     TextEditingController? contollerr,
//     int? inputLength,
//     String? regularExpression,
//     Widget? suffix,
//     final double? width,
//     int? maxLines,
//     int? maxLength,
//     TextInputAction? textInputAction,
//     TextCapitalization? capitalization,
//     String? validationType,
//     final Function()? onTap,
//     Icon? prifix,
//     FocusNode? focusNode,
//     Widget? prifixWidget,
//     required String? headingText}) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Padding(
//         padding: const EdgeInsets.only(bottom: 5),
//         child: Text(
//           headingText!,
//           style: FontTextStyle.blackRegular.copyWith(color: ColorUtils.grey9E),
//         ),
//       ),
//       Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: ColorUtils.white,
//             boxShadow: [
//               BoxShadow(
//                   color: ColorUtils.grey9E.withOpacity(0.5),
//                   blurRadius: 5,
//                   offset: const Offset(0, 0))
//             ]),
//         width: width,
//         child: TextFormField(
//             keyboardType: keyType,
//             textInputAction: textInputAction,
//             controller: contollerr,
//             textCapitalization: capitalization ?? TextCapitalization.none,
//             // focusNode: focusNode ?? FocusNode(),
//             inputFormatters: regularExpression != null
//                 ? [
//                     LengthLimitingTextInputFormatter(inputLength),
//                     FilteringTextInputFormatter.allow(RegExp(regularExpression))
//                   ]
//                 : [
//                     LengthLimitingTextInputFormatter(inputLength),
//                   ],
//             maxLines: maxLines ?? 1,
//             maxLength: maxLength,
//             onTap: onTap,
//             decoration: InputDecoration(
//               isDense: true,
//               hintText: hint,
//               contentPadding:
//                   EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//               suffixIcon: suffix,
//               border: InputBorder.none,
//               hintStyle: FontTextStyle.blackRegular
//                   .copyWith(color: ColorUtils.grey9E.withOpacity(0.5)),
//               prefixIcon: prifix,
//               prefix: prifixWidget,
//             ),
//             cursorColor: ColorUtils.primaryColor,
//             validator: validator,
//             style: const TextStyle(decoration: TextDecoration.none),
//             onChanged: onChange),
//       ),
//     ],
//   );
// }
