import 'package:flutter/material.dart';
import 'package:kiwni_driver/utils/constants.dart';

import '../utils/Dimentions.dart';
import '../utils/colors_helper.dart';

class RoundedButton extends StatelessWidget {
  Color fontColor;
  final double fontSize;
  FontWeight fontWeight;
  Color backgroundColor;
  Color borderColor;
  double borderRadius;
  String title;
  final VoidCallback onTap;
  bool isSuffix;
  IconData suffixIcon;
  double elevation;

  RoundedButton({
    Key? key,
    this.fontColor = ColorsHelper.blackColor,
    this.fontWeight = FontWeight.bold,
    required this.fontSize,
    this.backgroundColor = Colors.white,
    this.borderColor = ColorsHelper.primaryColor,
    this.borderRadius = 40,
    required this.onTap,
    required this.title,
    this.isSuffix = false,
    this.elevation = 2,
    this.suffixIcon = Icons.arrow_forward_ios_outlined,
  }) : super(key: key);
  // bo: BoxDecoration(
  // color: backgroundColor,
  // borderRadius: BorderRadius.circular(borderRadius),
  // border: Border.all(color: borderColor, width: 1),
  // ),

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height * .07,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: borderColor,
                width: 1.0,
                style: BorderStyle.solid), //set border for the button
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: elevation,
          onPrimary: backgroundColor,
        ),
        onPressed: onTap,
        child: Stack(
          children: [
            Center(
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: fontWeight,
                    fontSize: Diamentions.font16,
                    color: fontColor,
                    fontFamily: Constants.FONT_FAMILY),
              ),
            ),
            isSuffix
                ? Align(
                    alignment: Alignment.centerRight,
                    child: suffixIcon != null
                        ? Icon(
                            suffixIcon,
                            size: height * .03,
                            color: Colors.white,
                          )
                        : CircleAvatar(
                            backgroundColor: ColorsHelper.whiteColor,
                            child: Icon(
                              suffixIcon,
                              size: height * .03,
                              color: ColorsHelper.primaryColor,
                            )),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
