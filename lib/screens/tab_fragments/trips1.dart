import 'dart:async';

import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiwni_driver/providers/trips_providers.dart';
import 'package:kiwni_driver/utils/Dimentions.dart';
import 'package:kiwni_driver/utils/images_helper.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors_helper.dart';
import '../../utils/constants.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/text.dart';

class TripsFragment1 extends StatefulWidget {
  //int selectedIndex;

  TripsFragment1();

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
  SharedPreferences? prefs;
  // bool? isInitialDialogCalled;
  bool isInitialDialogClosed = false;

  bool hideCircle = false;
  var showLoading = true;

  CameraPosition? cameraPosition;

  _TripsFragment1State();
  @override
  void initState() {
    //  setDefaultPreferene();
    // SharedPreferenceUtils()
    //     .getBooleanPreference(Constants.IS_INITIAL_DIALOG_CALLED)
    //     .then((value) {
    //   isInitialDialogClosed = value!;
    //   print("KRUTI ::init  trips fragment::::${value}");
    //   print("KRUTI ::switch  trips fragment::::${switchValue}");
    // });
    cameraPosition = CameraPosition(
      target: LatLng(22.308155, 70.800705),
      zoom: 14.4746,
    );
    super.initState();
  }

  // setDefaultPreferene() async {
  //   await SharedPreferenceUtils()
  //       .savePreferences(Constants.IS_INITIAL_DIALOG_CALLED, false);
  // }

  @override
  Widget build(BuildContext context) {
    // if (switchValue && selectedIndex == 0)
    //   Future.delayed(Duration.zero, () => _showDialog(context));
    // SharedPreferenceUtils()
    //     .getBooleanPreference(Constants.IS_INITIAL_DIALOG_CALLED)
    //     .then((value) {
    //   print("KRUTI ::build  trips fragment::::${value}");
    //   print("KRUTI ::switch  trips fragment::::${switchValue}");
    //   isInitialDialogClosed = value!;
    // });

    //  Future.delayed(Duration.zero, () => showStartTripDialog(context));
    // Future.delayed(Duration.zero, () => showRatingDialog(context));

    return Consumer(
      builder: (context, watch, _) {
        var providerModel = watch(tripsProvider);
        Future.delayed(Duration(seconds: 3), () {
          if (mounted) if (providerModel.getIsDialogShown() &&
              providerModel.getSwitchMode()) {
            providerModel.setIsDialogShown(false);
            providerModel.showTripList(true);
          }
        });
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              if (providerModel.getSwitchMode())
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: 0,
                  child: Stack(
                    children: [
                      providerModel.getShowTripList()
                          ? getListView()
                          : getMapForOnSwitch(),
                      if (providerModel.getIsDialogShown() &&
                          providerModel.getSwitchMode())
                        getLoadingCircular(),
                      if (providerModel.getIsDialogShown() &&
                          providerModel.getSwitchMode())
                        getLoadingTitle()
                    ],
                  ),
                ),
              // KB show only map when switch is off
              if (!providerModel.getSwitchMode()) getUIForOffSwitch()
            ],
          ),
        );
      },
    );
  }

  // showLoadingProgress() async {
  //   await SharedPreferenceUtils()
  //       .getBooleanPreference(Constants.IS_INITIAL_DIALOG_CALLED)
  //       .then((value) {
  //     if (value!)
  //       return Container(
  //         child: Positioned(
  //           left: 0,
  //           right: 0,
  //           bottom: 0,
  //           top: 0,
  //           child: Image(
  //             image: AssetImage(ImagesHelper.IMG_CIRCLE),
  //             width: 200,
  //             height: 200,
  //           ),
  //         ),
  //       );
  //   });
  //
  //   return Container(
  //     width: 200,
  //     height: 200,
  //     color: Colors.red,
  //   );
  // }
  getMapForOnSwitch() {
    return GoogleMap(
      //   onTap: (latlng) => .toNamed("/tripDetails"),
      buildingsEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: true,
      // polylines: {..._provider.polyline},
      mapType: MapType.normal,
      initialCameraPosition: cameraPosition!,
      markers: {
        const Marker(
            markerId: MarkerId('SomeId'),
            position: LatLng(22.308155, 70.800705),
            infoWindow: InfoWindow(title: 'Rajkot'))
      },
      // circles: {
      //   Circle(circleId: CircleId("1"),
      //   center: LatLng(22.308155, 70.800705),
      //   radius: 430)
      // },
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  getUIForOffSwitch() {
    return GoogleMap(
      //   onTap: (latlng) => .toNamed("/tripDetails"),
      buildingsEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: true,
      // polylines: {..._provider.polyline},
      mapType: MapType.normal,
      initialCameraPosition: cameraPosition!,
      markers: {
        const Marker(
            markerId: MarkerId('SomeId'),
            position: LatLng(22.308155, 70.800705),
            infoWindow: InfoWindow(title: 'Rajkot'))
      },
      // circles: {
      //   Circle(circleId: CircleId("1"),
      //   center: LatLng(22.308155, 70.800705),
      //   radius: 430)
      // },
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  getLoadingTitle() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 0,
      child: Center(
        child: CustomText(
          title: "Loading....",
          fontSize: Diamentions.font25,
          fontWeight: FontWeight.bold,
          fontColor: ColorsHelper.blackColor,
        ),
      ),
    );
  }

  getLoadingCircular() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 0,
      child: Image(
        image: AssetImage(ImagesHelper.IMG_CIRCLE),
        width: 200,
        height: 200,
      ),
    );
  }

  getListView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: Diamentions.width20,
                right: Diamentions.width20,
                top: Diamentions.width20),
            child: Row(
              children: [
                Image(
                  image: AssetImage(
                    ImagesHelper.IMG_CAB_BLUE,
                  ),
                  width: Diamentions.width20,
                  height: Diamentions.width20,
                ),
                // Icon(
                //   Icons.car_rental_rounded,
                //   size: Diamentions.width30,
                //   color: ColorsHelper.primaryColor,
                // ),
                SizedBox(
                  width: Diamentions.width20,
                ),
                CustomText(
                  title: Constants.INCOMING_RIDE,
                  fontSize: Diamentions.font18,
                  fontWeight: FontWeight.bold,
                  fontColor: ColorsHelper.blackColor,
                )
              ],
            ),
          ),
          SizedBox(
            height: Diamentions.width20,
          ),
          Divider(
            height: 2,
            color: ColorsHelper.blackColor,
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFD6D6D6),
                            blurRadius: 10.0,
                          )
                        ],
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        color: Colors.white,
                        elevation: 4.0,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: Diamentions.width15,
                                  left: Diamentions.width15,
                                  right: Diamentions.width15,
                                  bottom: Diamentions.width15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: Diamentions.width10,
                                        height: Diamentions.width10,
                                        color: ColorsHelper.greenColor,
                                      ),
                                      SizedBox(
                                        width: Diamentions.width10,
                                      ),
                                      CustomText(
                                        title: "Pune",
                                        fontSize: Diamentions.font16,
                                        fontColor: ColorsHelper.blackColor,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: Diamentions.width20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: Diamentions.width10,
                                        height: Diamentions.width10,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        width: Diamentions.width10,
                                      ),
                                      CustomText(
                                        title: "Satara",
                                        fontSize: Diamentions.font16,
                                        fontColor: ColorsHelper.blackColor,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: Diamentions.width20,
                                  ),
                                  CustomText(
                                    title: "One Way",
                                    fontSize: Diamentions.font16,
                                    fontColor: ColorsHelper.blackColor,
                                    fontFamily: Constants.FONT_FAMILY_BOLD,
                                  ),
                                  SizedBox(
                                    height: Diamentions.width20,
                                  ),
                                  Stack(
                                    children: [
                                      CustomText(
                                        title: "Pickup Distance",
                                        fontSize: Diamentions.font16,
                                        fontColor: ColorsHelper.blackColor,
                                        fontFamily: Constants.FONT_FAMILY_BOLD,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: Diamentions.width30),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: CustomText(
                                            title: "Trip km",
                                            fontSize: Diamentions.font16,
                                            fontColor: ColorsHelper.blackColor,
                                            fontFamily:
                                                Constants.FONT_FAMILY_BOLD,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Diamentions.width10,
                                  ),
                                  Stack(
                                    children: [
                                      CustomText(
                                        title: "3.5 km",
                                        fontSize: Diamentions.font18,
                                        fontColor: ColorsHelper.blackColor,
                                        fontFamily: Constants.FONT_FAMILY_BOLD,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: Diamentions.width30),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: CustomText(
                                            title: "12 km",
                                            fontSize: Diamentions.font18,
                                            fontColor: ColorsHelper.blackColor,
                                            fontFamily:
                                                Constants.FONT_FAMILY_BOLD,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Diamentions.width20,
                                  ),
                                  CustomText(
                                    title: "Pickup Date & Time",
                                    fontSize: Diamentions.font16,
                                    fontColor: ColorsHelper.blackColor,
                                    fontFamily: Constants.FONT_FAMILY_BOLD,
                                  ),
                                  SizedBox(
                                    height: Diamentions.width5,
                                  ),
                                  CustomText(
                                    title: "12 -02-2022 07:30",
                                    fontSize: Diamentions.font18,
                                    fontColor: ColorsHelper.blackColor,
                                    fontFamily: Constants.FONT_FAMILY_BOLD,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(
                                    height: Diamentions.width10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        title: Constants.ARRIVING_TIME,
                                        fontSize: Diamentions.font14,
                                        fontColor: ColorsHelper.blackColor,
                                        fontFamily: Constants.FONT_FAMILY,
                                      ),
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        child: Column(
                                          children: [
                                            CustomText(
                                              title: "20 ",
                                              fontSize: Diamentions.font14,
                                              fontColor:
                                                  ColorsHelper.blackColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            CustomText(
                                              title: "min",
                                              fontSize: Diamentions.font14,
                                              fontColor:
                                                  ColorsHelper.blackColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 1,
                                              color: ColorsHelper.primaryColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Diamentions.width10,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: Diamentions.width140,
                              color: ColorsHelper.shadowColor,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RoundedButton(
                                        fontSize: Diamentions.font18,
                                        onTap: () {},
                                        title: Constants.DECLINE,
                                        fontColor: ColorsHelper.blackColor,
                                        fontWeight: FontWeight.bold,
                                        backgroundColor:
                                            ColorsHelper.whiteColor,
                                        borderColor: ColorsHelper.greyColor,
                                        borderRadius: 4,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RoundedButton(
                                        fontSize: Diamentions.font18,
                                        onTap: () {},
                                        title: Constants.ACCEPT,
                                        fontColor: ColorsHelper.whiteColor,
                                        fontWeight: FontWeight.bold,
                                        backgroundColor:
                                            ColorsHelper.primaryColor,
                                        borderColor: ColorsHelper.primaryColor,
                                        borderRadius: 4,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  void _showDialog(BuildContext context) async {
    showDialog(
        barrierDismissible: false,
        barrierColor: Color(0xe5eef2f5),
        context: context,
        builder: (context) => AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: Container(
                width: Diamentions.width300,
                height: Diamentions.width300,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                      child: Expanded(
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
                                              fontColor:
                                                  ColorsHelper.blackColor,
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
                          onTap: () async {
                            setState(() {
                              // SharedPreferenceUtils().savePreferences(
                              //     Constants.IS_INITIAL_DIALOG_CALLED, true);
                            });

                            // print(
                            //     "shared pref on button click ${SharedPreferenceUtils().getBooleanPreference(Constants.IS_INITIAL_DIALOG_CALLED)}");
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

  void showStartTripDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        barrierColor: Color(0xe5eef2f5),
        context: context,
        builder: (context) => AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: Column(
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
