import 'package:country_calling_code_picker/picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kiwni_driver/widgets/rounded_button.dart';

import '../../utils/Dimentions.dart';
import '../../utils/colors_helper.dart';
import '../../utils/constants.dart';
import '../../widgets/text.dart';

class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({Key? key}) : super(key: key);

  @override
  State<MobileNumberScreen> createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {
  Country? _selectedCountry;
  final _form_key = GlobalKey<FormState>();
  final TextEditingController mobileNumberController = TextEditingController();

  void initCountry() async {
    final country = await getDefaultCountry(context);
    setState(() {
      _selectedCountry = country;
    });
  }

  void _onPressedShowDialog() async {
    final country = await showCountryPickerDialog(
      context,
    );
    if (country != null) {
      setState(() {
        _selectedCountry = country;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    initCountry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final country = _selectedCountry;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
              left: Diamentions.width20,
              top: Diamentions.width10,
              right: Diamentions.width20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Diamentions.width50,
              ),
              CustomText(
                title: Constants.ENTER_MOBILE_NUMBER,
                fontSize: Diamentions.font25,
                fontColor: ColorsHelper.blackColor,
                fontFamily: Constants.FONT_FAMILY_BOLD,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: Diamentions.width50,
              ),
              Stack(
                children: [
                  country == null
                      ? Container()
                      : Container(
                          child: Form(
                            key: _form_key,
                            child: Row(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    print("callingcode:${country.callingCode}");
                                    _onPressedShowDialog();
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        country.flag,
                                        package: countryCodePackageName,
                                        width: 30,
                                        height: 30,
                                      ),
                                      SizedBox(
                                        width: Diamentions.width10,
                                      ),
                                      CustomText(
                                          fontColor: ColorsHelper.blackColor,
                                          title: '${country.callingCode}',
                                          fontSize: Diamentions.font16),
                                      SizedBox(
                                        width: Diamentions.width20,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: Diamentions.width10,
                                  child: Container(
                                    width: Diamentions.screenWidth -
                                        Diamentions.width200,
                                    child: Center(
                                      child: Expanded(
                                        child: TextFormField(
                                          controller: mobileNumberController,
                                          validator: (value) {
                                            if (value!.isEmpty ||
                                                value.length < 10) {
                                              return Constants
                                                  .MOBILE_NUMBER_VALIDATION;
                                            } else {
                                              return null;
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(10)
                                          ],
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              errorStyle: TextStyle(
                                                  fontSize: Diamentions.font18,
                                                  color: Colors.red),
                                              contentPadding: EdgeInsets.zero,
                                              labelStyle: TextStyle(
                                                  fontFamily:
                                                      Constants.FONT_FAMILY,
                                                  fontSize: Diamentions.font20),
                                              focusedBorder: InputBorder.none,
                                              hintText:
                                                  Constants.HINT_MOBILE_NUMBER,
                                              hintStyle: TextStyle(
                                                  fontFamily:
                                                      Constants.FONT_FAMILY,
                                                  fontSize:
                                                      Diamentions.font20)),
                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ],
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: ColorsHelper.greyColor,
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  softWrap: true,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  text: TextSpan(
                    text: Constants.MOBILE_NUMBER_DESC1,
                    style: TextStyle(
                        fontFamily: Constants.FONT_FAMILY,
                        color: ColorsHelper.greyColor,
                        fontSize: Diamentions.font14),
                    children: [
                      TextSpan(
                        text: Constants.TERMS,
                        style: TextStyle(
                            color: ColorsHelper.blackColor,
                            fontSize: Diamentions.font14),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => print('Tap Here onTap'),
                      ),
                      TextSpan(
                          text: Constants.AND,
                          style: TextStyle(
                              color: ColorsHelper.greyColor,
                              fontSize: Diamentions.font14)),
                      TextSpan(
                        text: Constants.PRIVACY_POLICY,
                        style: TextStyle(
                            color: ColorsHelper.blackColor,
                            fontSize: Diamentions.font14),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => print('Tap Here onTap'),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Diamentions.width50,
              ),
              Container(
                height: Diamentions.width50,
                child: RoundedButton(
                    fontColor: ColorsHelper.whiteColor,
                    backgroundColor: ColorsHelper.primaryColor,
                    fontSize: Diamentions.font18,
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      if (_form_key.currentState!.validate()) {
                        Get.toNamed('/verifyOtpScreen', arguments: [
                          {"mobile_number": mobileNumberController.text},
                        ]);
                      } else {}
                    },
                    title: Constants.CONTINUE),
              )
            ],
          ),
        ),
      ),
    );
  }
}
