import 'dart:async';

import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiwni_driver/utils/Dimentions.dart';
import 'package:kiwni_driver/utils/images_helper.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../utils/colors_helper.dart';
import '../../utils/constants.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/text.dart';

class TripsFragment1 extends StatefulWidget {
  const TripsFragment1({Key? key}) : super(key: key);

  @override
  State<TripsFragment1> createState() => _TripsFragment1State();
}

final list = [
  Constants.TITLE2,
  Constants.TITLE3,
  Constants.TITLE4,
  Constants.TITLE5
];

OtpFieldController otpController = OtpFieldController();

class _TripsFragment1State extends State<TripsFragment1> {
  Completer<GoogleMapController> _controller = Completer();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration.zero, () => _showDialog(context));
    //  Future.delayed(Duration.zero, () => showStartTripDialog(context));
    Future.delayed(Duration.zero, () => showRatingDialog(context));
    const CameraPosition cameraPosition = CameraPosition(
      target: LatLng(22.308155, 70.800705),
      zoom: 14.4746,
    );
    return Container(
      width: Diamentions.screenWidth,
      height: Diamentions.screenHeight,
      child: GoogleMap(
        //   onTap: (latlng) => .toNamed("/tripDetails"),
        buildingsEnabled: true,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: true,
        // polylines: {..._provider.polyline},
        mapType: MapType.normal,
        initialCameraPosition: cameraPosition,
        markers: {
          const Marker(
              markerId: MarkerId('SomeId'),
              position: LatLng(22.308155, 70.800705),
              infoWindow: InfoWindow(title: 'Rajkot'))
        },
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      //    onCameraMove: _onCameraMove,
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        barrierColor: Color(0xe5eef2f5),
        context: context,
        builder: (context) => AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Diamentions.screenWidth,
                    color: ColorsHelper.shadowColor,
                    child: Padding(
                      padding: EdgeInsets.all(Diamentions.width30),
                      child: CustomText(
                          maxLines: 2,
                          fontColor: ColorsHelper.primaryColor,
                          title: Constants.TITLE1,
                          alignment: TextAlign.left,
                          fontSize: Diamentions.font18),
                    ),
                  ),
                  Container(
                    width: Diamentions.screenWidth,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: Diamentions.screenWidth,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: ColorsHelper.primaryColor,
                                        size: Diamentions.width10,
                                      ),
                                      SizedBox(
                                        width: Diamentions.width20,
                                      ),
                                      Positioned(
                                        left: Diamentions.width30,
                                        child: CustomText(
                                          alignment: TextAlign.left,
                                          title: list[index],
                                          maxLines: 2,
                                          fontSize: Diamentions.font16,
                                          fontColor: ColorsHelper.blackColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: Diamentions.width90,
                      height: Diamentions.width30,
                      child: RoundedButton(
                        elevation: 0,
                        backgroundColor: ColorsHelper.whiteColor,
                        fontColor: ColorsHelper.primaryColor,
                        title: Constants.DISMISS,
                        fontSize: Diamentions.font14,
                        borderColor: ColorsHelper.whiteColor,
                        borderRadius: 0,
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      ),
                    ),
                  )
                ],
              ),
            ));
  }

  void showStartTripDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        barrierColor: Color(0xe5eef2f5),
        context: context,
        builder: (context) => AlertDialog(
              scrollable: true,
              content: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: Diamentions.width10,
                    left: Diamentions.width10,
                    right: Diamentions.width10,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        title: Constants.ENTER_OTP,
                        fontSize: Diamentions.font18,
                        fontColor: ColorsHelper.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: Diamentions.width10,
                      ),
                      SizedBox(
                        width: Diamentions.screenWidth,
                        child: Form(
                          key: formKey,
                          child: OTPTextField(
                              controller: otpController,
                              length: 5,
                              width: MediaQuery.of(context).size.width,
                              textFieldAlignment: MainAxisAlignment.spaceAround,
                              fieldWidth: Diamentions.width40,
                              fieldStyle: FieldStyle.underline,
                              outlineBorderRadius: 15,
                              style: TextStyle(fontSize: 17),
                              otpFieldStyle:
                                  OtpFieldStyle(focusBorderColor: Colors.black),
                              onChanged: (pin) {
                                print("Changed: " + pin);
                              },
                              onCompleted: (pin) {
                                print("Completed: " + pin);
                              }),
                        ),
                      ),
                      SizedBox(
                        height: Diamentions.width20,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: Diamentions.screenWidth,
                          height: Diamentions.width30,
                          child: RoundedButton(
                            elevation: 0,
                            backgroundColor: ColorsHelper.primaryColor,
                            fontColor: ColorsHelper.whiteColor,
                            title: Constants.VERIFY_AND_START_TRIP,
                            fontSize: Diamentions.font14,
                            borderColor: ColorsHelper.whiteColor,
                            borderRadius: 4,
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  void showStartBillingDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        barrierColor: Color(0xe5eef2f5),
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              contentPadding: EdgeInsets.zero,
              scrollable: true,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      color: ColorsHelper.primaryBackgroundColor,
                    ),
                    width: Diamentions.screenWidth,
                    height: Diamentions.width60,
                    child: Center(
                      child: CustomText(
                          fontWeight: FontWeight.bold,
                          fontColor: ColorsHelper.blackColor,
                          title: Constants.BILLING_DETAILS,
                          alignment: TextAlign.left,
                          fontSize: Diamentions.font18),
                    ),
                  ),
                  SizedBox(
                    height: Diamentions.width10,
                  ),
                  CustomText(
                      fontWeight: FontWeight.bold,
                      fontColor: ColorsHelper.blackColor,
                      title: Constants.TOTAL_PAYABLE,
                      alignment: TextAlign.left,
                      fontSize: Diamentions.font18),
                  SizedBox(
                    height: Diamentions.width20,
                  ),
                  CustomText(
                      fontWeight: FontWeight.bold,
                      fontColor: ColorsHelper.blackColor,
                      title: "240",
                      alignment: TextAlign.left,
                      fontSize: Diamentions.font25),
                  SizedBox(
                    height: Diamentions.width10,
                  ),
                  Image.asset(
                    ImagesHelper.IMG_QR,
                    width: Diamentions.width140,
                    height: Diamentions.width140,
                  ),
                  SizedBox(
                    height: Diamentions.width10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        fontColor: ColorsHelper.blackColor,
                        title: Constants.TOTAL_DISTANCE,
                        alignment: TextAlign.left,
                        fontSize: Diamentions.font16,
                        fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                      ),
                      SizedBox(
                        width: Diamentions.width10,
                      ),
                      CustomText(
                        fontColor: ColorsHelper.blackColor,
                        title: "13 km",
                        alignment: TextAlign.left,
                        fontSize: Diamentions.font16,
                        fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Diamentions.width10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        fontColor: ColorsHelper.blackColor,
                        title: Constants.TRIP_TIME,
                        alignment: TextAlign.left,
                        fontSize: Diamentions.font16,
                        fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                      ),
                      SizedBox(
                        width: Diamentions.width10,
                      ),
                      CustomText(
                        fontColor: ColorsHelper.blackColor,
                        title: "26 km",
                        alignment: TextAlign.left,
                        fontSize: Diamentions.font16,
                        fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Diamentions.width10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        fontColor: ColorsHelper.blackColor,
                        title: Constants.TOTAL_FAIR,
                        alignment: TextAlign.left,
                        fontSize: Diamentions.font16,
                        fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                      ),
                      SizedBox(
                        width: Diamentions.width10,
                      ),
                      CustomText(
                        fontColor: ColorsHelper.blackColor,
                        title: "` 390",
                        alignment: TextAlign.left,
                        fontSize: Diamentions.font16,
                        fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Diamentions.width10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        fontColor: ColorsHelper.blackColor,
                        title: Constants.DISCOUNT,
                        alignment: TextAlign.left,
                        fontSize: Diamentions.font16,
                        fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                      ),
                      SizedBox(
                        width: Diamentions.width10,
                      ),
                      CustomText(
                        fontColor: ColorsHelper.blackColor,
                        title: "` 190",
                        alignment: TextAlign.left,
                        fontSize: Diamentions.font16,
                        fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: Diamentions.screenWidth,
                      height: Diamentions.width50,
                      child: RoundedButton(
                        elevation: 2,
                        backgroundColor: ColorsHelper.primaryColor,
                        fontColor: ColorsHelper.whiteColor,
                        title: Constants.CONTINUE,
                        fontSize: Diamentions.font14,
                        borderColor: ColorsHelper.primaryColor,
                        borderRadius: 4,
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      ),
                    ),
                  )
                ],
              ),
            ));
  }

  void showRatingDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        barrierColor: Color(0xe5eef2f5),
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  0,
                ),
              ),
              contentPadding: EdgeInsets.zero,
              scrollable: true,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Diamentions.width30,
                  ),
                  CustomText(
                      fontColor: ColorsHelper.blackColor,
                      title: Constants.RATE_CUSTOMER,
                      alignment: TextAlign.left,
                      fontSize: Diamentions.font18),
                  SizedBox(
                    height: Diamentions.width20,
                  ),
                  CustomText(
                      fontColor: ColorsHelper.blackColor,
                      title: "Ramesh",
                      fontWeight: FontWeight.bold,
                      alignment: TextAlign.left,
                      fontSize: Diamentions.font18),
                  SizedBox(
                    height: Diamentions.width10,
                  ),
                  RatingBar(
                    isHalfAllowed: true,
                    size: Diamentions.screenWidth * 0.09,
                    alignment: Alignment.center,
                    filledIcon: Icons.star,
                    halfFilledIcon: Icons.star_half,
                    emptyIcon: Icons.star_border_outlined,
                    emptyColor: Colors.amber,
                    halfFilledColor: Colors.amber,
                    initialRating: 2.5,
                    maxRating: 5,
                    onRatingChanged: (double) {},
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      width: Diamentions.screenWidth,
                      height: Diamentions.width50,
                      child: RoundedButton(
                        elevation: 2,
                        backgroundColor: ColorsHelper.primaryColor,
                        fontColor: ColorsHelper.whiteColor,
                        title: Constants.CONTINUE,
                        fontSize: Diamentions.font14,
                        borderColor: ColorsHelper.primaryColor,
                        borderRadius: 4,
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}
