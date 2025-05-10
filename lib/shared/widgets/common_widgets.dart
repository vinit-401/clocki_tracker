import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

SizedBox heightWidget(double value) {
  return SizedBox(height: value);
}

SizedBox widthWidget(double value) {
  return SizedBox(width: value);
}

void hideKeyboard(context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

Widget progressBarCircle({double? strokeWidth}) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Center(
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 4,
        valueColor: const AlwaysStoppedAnimation<Color>(kPrimary),
      ),
    ),
  );
}

Widget progressBarCircleSmall({double? strokeWidth, double? padding}) {
  return Padding(
    padding: EdgeInsets.all(padding ?? 2.0),
    child: Center(
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 4,
        valueColor: const AlwaysStoppedAnimation<Color>(kPrimary),
      ),
    ),
  );
}
