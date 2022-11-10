import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwni_driver/utils/Dimentions.dart';
import 'package:kiwni_driver/utils/constants.dart';
import 'package:kiwni_driver/widgets/text.dart';

import '../utils/colors_helper.dart';
import '../utils/images_helper.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Diamentions.screenWidth,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Image(image: AssetImage(ImagesHelper.IMG_PICKUP)),
          SizedBox(
            height: Diamentions.width20,
          ),
          CustomText(
            title: Constants.PICKUP_POINT,
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
