import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwni_driver/utils/constants.dart';
import 'package:kiwni_driver/utils/images_helper.dart';

import '../../utils/Dimentions.dart';
import '../../utils/colors_helper.dart';
import '../../widgets/text.dart';

class Refer extends StatefulWidget {
  const Refer({Key? key}) : super(key: key);

  @override
  State<Refer> createState() => _ReferState();
}

class _ReferState extends State<Refer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: Diamentions.font18,
                    color: ColorsHelper.whiteColor,
                  ),
                  SizedBox(
                    width: Diamentions.width20,
                  ),
                  CustomText(
                    title: Constants.REFER,
                    fontSize: Diamentions.font18,
                    fontColor: ColorsHelper.whiteColor,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: Diamentions.width50,
            child: Padding(
              padding: EdgeInsets.only(
                  left: Diamentions.width20, right: Diamentions.width20),
              child: Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: Diamentions.width20, right: Diamentions.width20),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: Diamentions.width20,
                        ),
                        Container(
                          width: Diamentions.screenWidth,
                          height: Diamentions.width50,
                          color: ColorsHelper.lightGreenColor,
                          child: Center(
                            child: CustomText(
                              title: "${Constants.TOTAL_EARN} 0",
                              fontSize: Diamentions.font18,
                              fontColor: ColorsHelper.blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Diamentions.width40,
                        ),
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Container(
                            height: Diamentions.width200,
                            width: Diamentions.screenWidth,
                            decoration: BoxDecoration(
                                color: ColorsHelper.primaryColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                Expanded(
                                    child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: double.infinity,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: Diamentions.width5,
                                              right: Diamentions.width5),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  ImagesHelper.IC_GRP_BLUE,
                                                  width: Diamentions.width30,
                                                  height: Diamentions.width30,
                                                ),
                                              ),
                                              Positioned(
                                                left: 0,
                                                right: 0,
                                                child: Image.asset(
                                                  ImagesHelper.IMG_REFER,
                                                  width: Diamentions.width90,
                                                  height: Diamentions.width90,
                                                ),
                                              ),
                                              Positioned(
                                                right: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  ImagesHelper.IC_DOLLOR,
                                                  width: Diamentions.width25,
                                                  height: Diamentions.width25,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            CustomText(
                                              title: Constants.REFER_FRIEND,
                                              fontSize: Diamentions.font20,
                                            ),
                                            CustomText(
                                              alignment: TextAlign.start,
                                              title: Constants.REFER_STRING,
                                              fontSize: Diamentions.font12,
                                              maxLines: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                                Divider(
                                  height: 1,
                                  color: ColorsHelper.whiteColor,
                                  thickness: 1,
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.only(
                                      left: Diamentions.width10,
                                      right: Diamentions.width10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: Diamentions.width10,
                                      ),
                                      CustomText(
                                          title: "Your  referral Code",
                                          fontSize: Diamentions.font14),
                                      SizedBox(
                                        height: Diamentions.width10,
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                color: ColorsHelper.whiteColor,
                                                // boxShadow: [
                                                //   new BoxShadow(
                                                //     color: Colors.black,
                                                //     blurRadius: 20.0,
                                                //   ),
                                                // ],
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    color: Colors.white,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: CustomText(
                                                        title: "BE3KIWNI",
                                                        fontSize:
                                                            Diamentions.font16,
                                                        fontColor: ColorsHelper
                                                            .blackColor,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: Diamentions.width45,
                                                    height: Diamentions.width45,
                                                    decoration: BoxDecoration(
                                                        gradient: LinearGradient(
                                                            colors: [
                                                          Color(0xff8b3ce5),
                                                          Color(0xff4b167f),
                                                        ],
                                                            begin: Alignment
                                                                .topCenter,
                                                            end: AlignmentDirectional
                                                                .bottomCenter)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Image.asset(
                                                        ImagesHelper.IMG_COPY,
                                                        width:
                                                            Diamentions.width30,
                                                        height:
                                                            Diamentions.width30,
                                                        color: ColorsHelper
                                                            .blackColor,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    ColorsHelper.whiteColor,
                                                child: Icon(
                                                  Icons.ios_share,
                                                  size: Diamentions.width30,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
