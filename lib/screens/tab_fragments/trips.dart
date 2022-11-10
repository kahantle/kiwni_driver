import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwni_driver/screens/tab_fragments/trips1.dart';
import 'package:kiwni_driver/utils/constants.dart';
import 'package:kiwni_driver/utils/images_helper.dart';
import 'package:kiwni_driver/widgets/rounded_button.dart';
import 'package:kiwni_driver/widgets/text.dart';

import '../../utils/Dimentions.dart';
import '../../utils/colors_helper.dart';

class TripsFragment extends StatefulWidget {
  TripsFragment({Key? key}) : super(key: key);

  @override
  State<TripsFragment> createState() => _TripsFragmentState();
}

class _TripsFragmentState extends State<TripsFragment> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Diamentions.screenHeight,
      width: Diamentions.screenWidth,
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
                  image: const AssetImage(
                    ImagesHelper.IMG_CAB_BLUE,
                  ),
                  width: Diamentions.width20,
                  height: Diamentions.width20,
                ),
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
          const Divider(
            height: 2,
            color: ColorsHelper.blackColor,
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                                    title: Constants.ONE_WAY,
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
                                        title: Constants.PICKUP_DISTANCE,
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
                                            title: Constants.TRIP_KM,
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
                                    title: Constants.PICKUP_TIME,
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
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 1,
                                              color: ColorsHelper.primaryColor),
                                        ),
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
                  SizedBox(
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
                                child: SizedBox(
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
}
