import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/Dimentions.dart';
import '../../utils/colors_helper.dart';
import '../../utils/constants.dart';
import '../../widgets/text.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: Diamentions.screenWidth,
              height: Diamentions.width90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                  color: ColorsHelper.primaryColor),
              child: Padding(
                padding: EdgeInsets.only(
                    top: Diamentions.width20,
                    left: Diamentions.width10,
                    right: Diamentions.width10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: Diamentions.font20,
                        color: ColorsHelper.whiteColor,
                      ),
                    ),
                    SizedBox(
                      width: Diamentions.width20,
                    ),
                    CustomText(
                      title: Constants.MY_PROFILE,
                      fontSize: Diamentions.font20,
                      fontColor: ColorsHelper.whiteColor,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Diamentions.width30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: Diamentions.width100,
                      height: Diamentions.width100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          border: Border.all(
                              color: ColorsHelper.greyColor, width: 2)),
                      child: CircleAvatar(
                        backgroundColor: ColorsHelper.whiteColor,
                        child: Icon(
                          Icons.person,
                          size: Diamentions.width90,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Diamentions.width10,
                    ),
                    CustomText(
                      title: "Ramesh Kulkarni",
                      fontSize: Diamentions.font18,
                      fontColor: ColorsHelper.blackColor,
                    ),
                    CustomText(
                      title: Constants.EDIT_PROFILE,
                      fontSize: Diamentions.font16,
                      fontColor: ColorsHelper.primaryColor,
                    ),
                    SizedBox(
                      height: Diamentions.width30,
                    ),
                    Container(
                      color: ColorsHelper.primaryBackgroundColor,
                      width: Diamentions.screenWidth,
                      height: Diamentions.width50,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: Diamentions.width40),
                          child: CustomText(
                            alignment: TextAlign.start,
                            title: Constants.PERSONAL_INFORMATION,
                            fontSize: Diamentions.font18,
                            fontWeight: FontWeight.bold,
                            fontColor: ColorsHelper.blackColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Diamentions.width40,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Diamentions.width40,
                            vertical: Diamentions.width15),
                        child: CustomText(
                          alignment: TextAlign.start,
                          title: Constants.NAME,
                          fontSize: Diamentions.font18,
                          fontColor: ColorsHelper.blackColor,
                        ),
                      ),
                    ),
                    Divider(
                      height: 2,
                      color: ColorsHelper.greyColor,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Diamentions.width40,
                            vertical: Diamentions.width15),
                        child: CustomText(
                          alignment: TextAlign.start,
                          title: Constants.NUMBER,
                          fontSize: Diamentions.font18,
                          fontColor: ColorsHelper.blackColor,
                        ),
                      ),
                    ),
                    Divider(
                      height: 2,
                      color: ColorsHelper.greyColor,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Diamentions.width40,
                            vertical: Diamentions.width15),
                        child: CustomText(
                          alignment: TextAlign.start,
                          title: Constants.CURRENT_ADDRESS,
                          fontSize: Diamentions.font18,
                          fontColor: ColorsHelper.blackColor,
                        ),
                      ),
                    ),
                    Divider(
                      height: 2,
                      color: ColorsHelper.greyColor,
                    ),
                    Container(
                      color: ColorsHelper.primaryBackgroundColor,
                      width: Diamentions.screenWidth,
                      height: Diamentions.width50,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: Diamentions.width40),
                          child: CustomText(
                            alignment: TextAlign.start,
                            title: Constants.DOCUMENTS,
                            fontSize: Diamentions.font18,
                            fontWeight: FontWeight.bold,
                            fontColor: ColorsHelper.blackColor,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Diamentions.width40,
                                vertical: Diamentions.width15),
                            child: CustomText(
                              alignment: TextAlign.start,
                              title: Constants.BANK_DETAILS,
                              fontSize: Diamentions.font18,
                              fontColor: ColorsHelper.blackColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: Diamentions.width40),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: Diamentions.width20,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 2,
                      color: ColorsHelper.greyColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Diamentions.width40,
                                vertical: Diamentions.width15),
                            child: CustomText(
                              alignment: TextAlign.start,
                              title: Constants.PERSONAL_DOCUMENTS,
                              fontSize: Diamentions.font18,
                              fontColor: ColorsHelper.blackColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: Diamentions.width40),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: Diamentions.width20,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 2,
                      color: ColorsHelper.greyColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Diamentions.width40,
                                vertical: Diamentions.width15),
                            child: CustomText(
                              alignment: TextAlign.start,
                              title: Constants.CAR_DOCUMENTS,
                              fontSize: Diamentions.font18,
                              fontColor: ColorsHelper.blackColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: Diamentions.width40),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: Diamentions.width20,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: ColorsHelper.primaryBackgroundColor,
                      width: Diamentions.screenWidth,
                      height: Diamentions.width50,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: Diamentions.width40),
                          child: CustomText(
                            alignment: TextAlign.start,
                            title: Constants.LANGUAGE_PREFERENCES,
                            fontSize: Diamentions.font18,
                            fontWeight: FontWeight.bold,
                            fontColor: ColorsHelper.blackColor,
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 2,
                      color: ColorsHelper.greyColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Diamentions.width40,
                                vertical: Diamentions.width15),
                            child: CustomText(
                              alignment: TextAlign.start,
                              title: Constants.SMS_TRANNING,
                              fontSize: Diamentions.font18,
                              fontColor: ColorsHelper.blackColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: Diamentions.width40),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: Diamentions.width20,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 2,
                      color: ColorsHelper.greyColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Diamentions.width40,
                                vertical: Diamentions.width15),
                            child: CustomText(
                              alignment: TextAlign.start,
                              title: Constants.SMS_TRANNING,
                              fontSize: Diamentions.font18,
                              fontColor: ColorsHelper.blackColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: Diamentions.width40),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: Diamentions.width20,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 2,
                      color: ColorsHelper.greyColor,
                    ),
                    Container(
                      width: Diamentions.screenWidth,
                      color: ColorsHelper.primaryBackgroundColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Diamentions.width40,
                                  vertical: Diamentions.width15),
                              child: CustomText(
                                alignment: TextAlign.start,
                                title: Constants.CHANAGE_PASSWORD,
                                fontSize: Diamentions.font18,
                                fontWeight: FontWeight.bold,
                                fontColor: ColorsHelper.blackColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(right: Diamentions.width40),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: Diamentions.width20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
