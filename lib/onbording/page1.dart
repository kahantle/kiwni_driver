import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwni_driver/utils/Dimentions.dart';
import 'package:kiwni_driver/utils/colors_helper.dart';
import 'package:kiwni_driver/utils/constants.dart';
import 'package:kiwni_driver/utils/images_helper.dart';

import '../widgets/text.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Diamentions.screenWidth,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Image(image: AssetImage(ImagesHelper.IMG_RIDE)),
          SizedBox(
            height: Diamentions.width20,
          ),
          CustomText(
            title: Constants.RIDE,
            fontSize: Diamentions.font18,
            fontColor: ColorsHelper.blackColor,
          ),
          SizedBox(
            height: Diamentions.width200,
          ),
        ],
      ),
    );
  }
}
