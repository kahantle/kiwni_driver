import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwni_driver/utils/Dimentions.dart';
import 'package:kiwni_driver/utils/colors_helper.dart';
import 'package:kiwni_driver/utils/constants.dart';
import 'package:kiwni_driver/widgets/rounded_button.dart';
import 'package:kiwni_driver/widgets/text.dart';

class SupportFragment extends StatefulWidget {
  const SupportFragment({Key? key}) : super(key: key);

  @override
  State<SupportFragment> createState() => _SupportFragmentState();
}

class _SupportFragmentState extends State<SupportFragment> {
  List list = [
    Constants.SAFTEY_TOPC1,
    Constants.SAFTEY_TOPC2,
    Constants.SAFTEY_TOPC3,
    Constants.SAFTEY_TOPC4,
    Constants.SAFTEY_TOPC5
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: Diamentions.screenWidth,
              height: Diamentions.width100,
              child: Padding(
                padding: EdgeInsets.all(Diamentions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            RoundedButton(
                              fontSize: Diamentions.font14,
                              onTap: () {},
                              title: Constants.APP_NOT_WORKING,
                              fontColor: ColorsHelper.blackColor,
                              backgroundColor:
                                  ColorsHelper.primaryBackgroundColor,
                              borderColor: ColorsHelper.primaryBackgroundColor,
                              borderRadius: 2,
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: Diamentions.width20,
                                color: ColorsHelper.blackColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            RoundedButton(
                              fontSize: Diamentions.font14,
                              onTap: () {},
                              title: Constants.STATUS_OF_MY_CITY,
                              fontColor: ColorsHelper.blackColor,
                              backgroundColor:
                                  ColorsHelper.primaryBackgroundColor,
                              borderColor: ColorsHelper.primaryBackgroundColor,
                              borderRadius: 2,
                            ),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              right: 0,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: Diamentions.width20,
                                color: ColorsHelper.blackColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  color: Colors.red,
                  width: Diamentions.width200,
                  height: Diamentions.width50,
                  child: Stack(
                    children: [
                      RoundedButton(
                        fontSize: Diamentions.font14,
                        onTap: () {},
                        title: Constants.SAFTEY,
                        fontColor: ColorsHelper.blackColor,
                        backgroundColor: ColorsHelper.primaryBackgroundColor,
                        borderColor: ColorsHelper.primaryBackgroundColor,
                        borderRadius: 2,
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        right: 0,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: Diamentions.width20,
                          color: ColorsHelper.blackColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Diamentions.width30,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: Diamentions.width20),
          child: CustomText(
            title: Constants.OTHER_HELP_TOPICS,
            fontSize: Diamentions.font18,
            fontColor: ColorsHelper.blackColor,
            fontWeight: FontWeight.bold,
            fontFamily: Constants.FONT_FAMILY_BOLD,
          ),
        ),
        SizedBox(
          width: Diamentions.screenWidth,
          child: Padding(
            padding: EdgeInsets.only(
                top: Diamentions.width10,
                left: Diamentions.width10,
                right: Diamentions.width10),
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 0),
                itemCount: list.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Diamentions.width10,
                        vertical: Diamentions.width10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: Diamentions.width10,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: Diamentions.width10,
                        ),
                        CustomText(
                          title: list[index],
                          fontSize: Diamentions.font16,
                          fontColor: ColorsHelper.blackColor,
                        )
                      ],
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }
}
