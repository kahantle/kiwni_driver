import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors_helper.dart';
import '../utils/constants.dart';

class CustomText extends StatelessWidget {
  String title;
  Color fontColor;
  FontWeight fontWeight;
  double? fontSize;
  String fontFamily;
  TextAlign? alignment;
  int? maxLines;

  CustomText(
      {Key? key,
      required this.title,
      this.fontWeight = FontWeight.normal,
      this.fontColor = ColorsHelper.whiteColor,
      required this.fontSize,
      this.fontFamily = Constants.FONT_FAMILY,
      this.alignment = TextAlign.center,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: alignment,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: fontColor,
        overflow: TextOverflow.ellipsis,
        fontFamily: fontFamily,
      ),
    );
  }
}
