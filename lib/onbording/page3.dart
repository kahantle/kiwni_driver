import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kiwni_driver/utils/Dimentions.dart';

import '../utils/colors_helper.dart';
import '../utils/constants.dart';
import '../utils/images_helper.dart';
import '../widgets/rounded_button.dart';
import '../widgets/text.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Diamentions.screenWidth,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Image(image: AssetImage(ImagesHelper.IMG_DROP)),
          SizedBox(
            height: Diamentions.width20,
          ),
          CustomText(
            title: Constants.DROP_POINT,
            fontSize: Diamentions.font18,
            fontColor: ColorsHelper.blackColor,
          ),
          SizedBox(
            height: Diamentions.width20,
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: SizedBox(
              height: Diamentions.width50,
              child: RoundedButton(
                  fontColor: ColorsHelper.whiteColor,
                  backgroundColor: ColorsHelper.primaryColor,
                  fontSize: Diamentions.font18,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Get.toNamed('/mobileNumberScreen');
                  },
                  title: Constants.CONTINUE),
            ),
          ),
        ],
      ),
    );
  }
}
