import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../app_color.dart';
import '../dimen.dart';

/// font style
tStyleBold({color, weight, fontSize, spacing, height, fontFamily}) {
  return TextStyle(
    fontSize: getBoldFontSize(fontSize) ?? Dimen.FONT_SIZE_MEDIUM,
    color: color ?? kTextBlack,
    fontFamily: getBoldFontFamily(fontFamily),
    letterSpacing: spacing ?? 0.14,
    height: height ?? 1.1,
    fontWeight: weight ?? FontWeight.w700, // default weight for bold is 700
  );
}

// tStyleSemiBold({color, weight, fontSize, spacing, height}) {
//   return TextStyle(
//     fontSize: fontSize ?? Dimen.FONT_SIZE_MEDIUM,
//     color: color ?? kTextBlack,
//     height: height ?? 1.0,
//     fontFamily: AppConstants.InterSemiBold,
//     letterSpacing: spacing ?? 0.14,
//     fontWeight: weight ?? FontWeight.w600, // default weight for bold is 600
//   );
// }

tStyleMedium({color, weight, fontSize, spacing, height, fontFamily}) {
  return TextStyle(
    fontSize: getMediumFontSize(fontSize) ?? Dimen.FONT_SIZE_MEDIUM,
    letterSpacing: spacing ?? 0.14,
    color: color ?? kTextBlack,
    height: height ?? 1,
    fontFamily: getMediumFontFamily(fontFamily),
    fontWeight: weight ?? FontWeight.w500, //
    // default weight for medium is 500
  );
}

tStyleRegular({color, weight, fontSize, fontFamily}) {
  return TextStyle(
    letterSpacing: 0.14,
    fontSize: getRegularFontSize(fontSize) ?? Dimen.FONT_SIZE_MEDIUM,
    color: color ?? kTextBlack,
    fontFamily: getRegularFontFamily(fontFamily),
    decoration: TextDecoration.none,
    fontWeight:
        weight ?? FontWeight.normal, // default weight for reguler is normal
  );
}

/////////////////////////////////////=====>AppTypography only three.. bold, medium and regular
/// Three font family till poppins , inter and raleway.. default for android is roboto and for iOS San Francisco font family
String? getRegularFontFamily(String? name) {
  if (name == null) return null;
  switch (name) {
    case 'Poppins':
      return AppConstants.PoppinsRegular;
  }
  return null;
}

String? getBoldFontFamily(String? name) {
  if (name == null) return null;
  switch (name) {
    case 'Poppins':
      return AppConstants.PoppinsBold;
  }
  return null;
}

String? getMediumFontFamily(String? name) {
  if (name == null) return null;
  switch (name) {
    case 'Poppins':
      return AppConstants.PoppinsMedium;
  }
  return null;
}

double? getRegularFontSize(num? value) {
  return double.tryParse(value.toString());
}

double? getBoldFontSize(num? value) {
  return double.tryParse(value.toString());
}

double? getMediumFontSize(num? value) {
  return double.tryParse(value.toString());
}
