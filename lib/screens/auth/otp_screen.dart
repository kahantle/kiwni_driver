import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kiwni_driver/utils/Dimentions.dart';
import 'package:kiwni_driver/utils/colors_helper.dart';
import 'package:kiwni_driver/utils/constants.dart';
import 'package:kiwni_driver/widgets/text.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../widgets/rounded_button.dart';

class OTPVerification extends StatefulWidget {
  dynamic arguments = Get.arguments;
  OTPVerification({Key? key}) : super(key: key);

  @override
  State<OTPVerification> createState() => _OTPVerificationState(arguments);
}

class _OTPVerificationState extends State<OTPVerification> {
  dynamic arguments;
  var form_key = GlobalKey<FormState>();
  String strVerificationCode = "";
  OtpFieldController otpController = OtpFieldController();
  _OTPVerificationState(this.arguments);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: Diamentions.width20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Diamentions.width100,
              ),
              CustomText(
                title: Constants.OTP_VERIFICATION,
                fontSize: Diamentions.font20,
                fontWeight: FontWeight.bold,
                fontColor: ColorsHelper.blackColor,
              ),
              SizedBox(
                height: Diamentions.width20,
              ),
              CustomText(
                title: Constants.OTP_VERIFICATION_DESC,
                fontSize: Diamentions.font16,
                fontWeight: FontWeight.bold,
                fontColor: ColorsHelper.greyColor,
              ),
              SizedBox(
                height: Diamentions.width10,
              ),
              Row(
                children: [
                  CustomText(
                    title: "+91 " + arguments[0]['mobile_number'],
                    fontSize: Diamentions.font16,
                    fontWeight: FontWeight.bold,
                    fontColor: ColorsHelper.blackColor,
                  ),
                  SizedBox(
                    width: Diamentions.width10,
                  ),
                  CustomText(
                    title: Constants.EDIT,
                    fontSize: Diamentions.font16,
                    fontWeight: FontWeight.bold,
                    fontColor: ColorsHelper.primaryColor,
                  ),
                ],
              ),
              SizedBox(
                height: Diamentions.width30,
              ),
              Form(
                key: form_key,
                child: OTPTextField(
                  controller: otpController,
                  length: 5,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 45,
                  fieldStyle: FieldStyle.underline,
                  outlineBorderRadius: 15,
                  style: TextStyle(fontSize: 17),
                  otpFieldStyle: OtpFieldStyle(focusBorderColor: Colors.black),
                  onChanged: (pin) {
                    print("Changed: " + pin);
                  },
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                  },
                ),
              ),
              SizedBox(
                height: Diamentions.width50,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: Diamentions.width30, right: Diamentions.width30),
                height: Diamentions.width50,
                child: RoundedButton(
                    fontColor: ColorsHelper.whiteColor,
                    backgroundColor: ColorsHelper.primaryColor,
                    fontSize: Diamentions.font18,
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      if (form_key.currentState!.validate()) {
                        Get.toNamed("/home");
                      } else {}
                    },
                    title: Constants.VERIFY),
              ),
              SizedBox(
                height: Diamentions.width20,
              ),
              Center(
                child: CustomText(
                  title: Constants.RESEND_CODE,
                  fontSize: Diamentions.font16,
                  fontWeight: FontWeight.bold,
                  fontColor: ColorsHelper.greenColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
