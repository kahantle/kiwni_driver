import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kiwni_driver/providers/trips_providers.dart';
import 'package:kiwni_driver/utils/Dimentions.dart';
import 'package:kiwni_driver/utils/colors_helper.dart';
import 'package:kiwni_driver/utils/constants.dart';
import 'package:kiwni_driver/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

import '../../utils/images_helper.dart';
import '../../widgets/text.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TripsProvider()),
      ],
      child: Scaffold(
        body: Container(
          color: Colors.transparent,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Diamentions.width90,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      title: Constants.WEL_COME,
                      fontSize: Diamentions.font20,
                      fontColor: ColorsHelper.blackColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                    ),
                    CustomText(
                      title: Constants.KIWNI_CLUB,
                      fontSize: Diamentions.font20,
                      fontColor: ColorsHelper.primaryColor,
                      fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                    ),
                  ],
                ),
                SizedBox(
                  height: Diamentions.width50,
                ),
                Container(
                  width: Diamentions.width140,
                  height: Diamentions.width140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      border: Border.all(
                          color: ColorsHelper.primaryColor, width: 1)),
                  child: CircleAvatar(
                    backgroundColor: ColorsHelper.whiteColor,
                    child: Icon(
                      Icons.person,
                      size: Diamentions.width90,
                    ),
                  ),
                ),
                SizedBox(
                  height: Diamentions.width30,
                ),
                CustomText(
                  title: Constants.RAMESH,
                  fontSize: Diamentions.font20,
                  fontColor: ColorsHelper.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                ),
                SizedBox(
                  height: Diamentions.width50,
                ),
                Container(
                  width: Diamentions.width200,
                  height: Diamentions.width30,
                  child: RoundedButton(
                    borderRadius: 15,
                    backgroundColor: ColorsHelper.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Diamentions.font18,
                    fontColor: ColorsHelper.whiteColor,
                    onTap: () {
                      Get.toNamed("/home");
                    },
                    title: Constants.PROCEED,
                  ),
                ),
                SizedBox(
                  height: Diamentions.width50,
                ),
                Container(child: Image(image: AssetImage(ImagesHelper.IMG_BG))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
