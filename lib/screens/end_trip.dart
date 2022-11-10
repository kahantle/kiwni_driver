import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiwni_driver/utils/Dimentions.dart';
import 'package:kiwni_driver/widgets/rounded_button.dart';
import 'package:kiwni_driver/widgets/text.dart';

import '../utils/colors_helper.dart';
import '../utils/constants.dart';
import '../utils/images_helper.dart';

class EndTrip extends StatefulWidget {
  const EndTrip({Key? key}) : super(key: key);

  @override
  State<EndTrip> createState() => _EndTripState();
}

class _EndTripState extends State<EndTrip> {
  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(22.308155, 70.800705),
    zoom: 14.4746,
  );
  final Completer<GoogleMapController> _controller = Completer();
  bool? value2;
  @override
  void initState() {
    // TODO: implement initState
    value2 = false;
  }

  Widget buildSpecialAndroidSwitch() => SizedBox(
        width: Diamentions.width120,
        height: Diamentions.width100,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Switch(
              trackColor: value2 == true
                  ? MaterialStateProperty.all(Colors.green)
                  : MaterialStateProperty.all(Colors.black38),

              // thumb colors
              activeColor: Colors.green.withOpacity(0.4),
              inactiveThumbColor: Colors.red.withOpacity(0.4),
              activeThumbImage: const AssetImage(
                ImagesHelper.IMG_CAB,
              ),
              inactiveThumbImage: AssetImage(ImagesHelper.IMG_CAB),
              value: value2!,
              onChanged: (value) {
                setState(() => this.value2 = value);
              }),
        ),
      );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .70,
                child: Column(
                  children: [
                    Container(
                      width: Diamentions.screenWidth,
                      height: Diamentions.width100,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                          color: ColorsHelper.primaryColor),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: Diamentions.width30,
                            left: Diamentions.width10,
                            right: Diamentions.width10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                print("KJKJKJK");
                              },
                              child: Container(
                                child: CircleAvatar(
                                  backgroundColor: ColorsHelper.whiteColor,
                                  child: Icon(
                                    Icons.person,
                                    size: Diamentions.width40,
                                  ),
                                ),
                              ),
                            ),
                            //  buildSpecialAndroidSwitch(),
                            Icon(
                              Icons.notifications,
                              size: Diamentions.width50,
                              color: ColorsHelper.whiteColor,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: Diamentions.screenWidth,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: Diamentions.width30,
                            right: Diamentions.width30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage(ImagesHelper.IC_CHAT),
                              width: Diamentions.width20,
                              height: Diamentions.width20,
                            ),
                            // Icon(
                            //   Icons.chat_bubble_outline,
                            //   size: Diamentions.width30,
                            //   color: Colors.grey,
                            // ),
                            Column(
                              children: [
                                SizedBox(
                                  height: Diamentions.width10,
                                ),
                                CircleAvatar(
                                  child: Icon(
                                    Icons.person,
                                    size: Diamentions.width15,
                                  ),
                                ),
                                Container(
                                  height: Diamentions.width30,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: const AssetImage(
                                            ImagesHelper.IMG_CAB_BLUE),
                                        width: Diamentions.width30,
                                        height: Diamentions.width30,
                                      ),
                                      // Icon(
                                      //   Icons.car_rental_rounded,
                                      //   size: Diamentions.width30,
                                      // ),
                                      Center(
                                        child: CustomText(
                                            title: Constants.DROP_POINT,
                                            fontWeight: FontWeight.bold,
                                            fontColor: ColorsHelper.blackColor,
                                            fontSize: Diamentions.font14),
                                      )
                                    ],
                                  ),
                                ),
                                CustomText(
                                    title: "Sakshi",
                                    fontWeight: FontWeight.bold,
                                    fontColor: ColorsHelper.greyColor,
                                    fontSize: Diamentions.font14),
                                SizedBox(
                                  height: Diamentions.width10,
                                )
                              ],
                            ),
                            Image(
                              image: AssetImage(ImagesHelper.IC_CALL),
                              width: Diamentions.width30,
                              height: Diamentions.width30,
                            ),
                            // Icon(
                            //   Icons.call,
                            //   size: Diamentions.width40,
                            //   color: Colors.grey,
                            // )
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      height: 2,
                      color: ColorsHelper.blackColor,
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
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
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Colors.black38!,
                                      blurRadius: 4.0,
                                      spreadRadius: 2.0,
                                    )
                                  ], borderRadius: BorderRadius.circular(14)),
                                  child: const CircleAvatar(
                                    backgroundColor: ColorsHelper.whiteColor,
                                    radius: 20,
                                    child: Text(Constants.SOS),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color: Colors.black38!,
                                        blurRadius: 10.0,
                                        spreadRadius: 2.0)
                                  ]),
                                  child: const CircleAvatar(
                                    backgroundColor: ColorsHelper.whiteColor,
                                    radius: 20,
                                    child: Text(Constants.HELP),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: Diamentions.screenWidth,
                height: MediaQuery.of(context).size.height * .30,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: Diamentions.width20,
                      right: Diamentions.width20,
                      top: Diamentions.width50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: Constants.Location,
                        fontSize: Diamentions.font20,
                        fontColor: ColorsHelper.primaryColor,
                      ),
                      SizedBox(
                        height: Diamentions.width30,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: Diamentions.width300,
                            child: CustomText(
                              alignment: TextAlign.left,
                              maxLines: 2,
                              title: Constants.address,
                              fontSize: Diamentions.font20,
                              fontColor: ColorsHelper.blackColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Diamentions.width10,
                      ),
                      RoundedButton(
                          fontSize: Diamentions.font20,
                          onTap: () {},
                          borderColor: ColorsHelper.redColor,
                          borderRadius: 4,
                          fontWeight: FontWeight.bold,
                          fontColor: ColorsHelper.whiteColor,
                          backgroundColor: ColorsHelper.redColor,
                          title: Constants.END_TRIP)
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .65,
                right: 20.0,
                left: 20.0),
            child: Container(
              height: Diamentions.width60,
              width: Diamentions.width140,
              child: Card(
                color: Colors.white,
                elevation: 4.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: const AssetImage(ImagesHelper.IC_CASH),
                      width: Diamentions.width40,
                      height: Diamentions.width40,
                    ),
                    // Icon(
                    //   Icons.money,
                    //   size: Diamentions.width40,
                    // ),
                    SizedBox(
                      width: Diamentions.width10,
                    ),
                    CustomText(
                      title: Constants.CASH,
                      fontSize: Diamentions.font18,
                      fontWeight: FontWeight.bold,
                      fontColor: ColorsHelper.blackColor,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
