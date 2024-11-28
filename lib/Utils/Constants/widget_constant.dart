import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxbase/Utils/Constants/color_constant.dart';

class WidgetConstants {
  ///
  /// This method is used for show text in ui with some prebuild properties
  static Text text(String text,
      {Color color = ColorConstants.textPrimaryColor,
      FontWeight fontWeight = FontWeight.normal,
      double fontSize = 16.0,
      double letterSpacing = 0.5,
      TextOverflow? textOverflow,
      TextAlign textAlign = TextAlign.center,
      int? maxLine,
      TextDecoration decoration = TextDecoration.none}) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      maxLines: maxLine,
      style: TextStyle(
        decoration: decoration,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      ),
    );
  }

  ///
  /// Error SnackBar
  static errorSnackBar({
    required String content,
    Color textColor = ColorConstants.whiteColor,
  }) {
    return Get.snackbar(
      'Error',
      content,
      backgroundColor: Colors.red[400],
      colorText: textColor,
      borderRadius: 10,
    );
  }

  ///
  /// Success SnackBar
  static successSnackBar({
    required String content,
    Color textColor = ColorConstants.blackColor,
  }) {
    return Get.snackbar(
      'Success',
      content,
      backgroundColor: Colors.green[100]!.withOpacity(0.8),
      borderRadius: 6,
      colorText: textColor,
    );
  }
}
