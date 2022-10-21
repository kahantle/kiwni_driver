import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwni_driver/utils/Dimentions.dart';

import '../utils/colors_helper.dart';
import '../utils/images_helper.dart';
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
          Image(image: AssetImage(ImagesHelper.IMG_DROP)),
          SizedBox(
            height: Diamentions.width20,
          ),
          CustomText(
            title: "Drop Point",
            fontSize: Diamentions.font18,
            fontColor: ColorsHelper.blackColor,
          ),
          SizedBox(
            height: Diamentions.width200,
          ),
        ],
      ),
    );

    Container(
      width: Diamentions.screenWidth,
      height: Diamentions.screenHeight,
      child: Center(
        child: Column(
          children: [
            Center(child: Image(image: AssetImage(ImagesHelper.IMG_DROP))),
            SizedBox(
              height: Diamentions.width20,
            ),
            CustomText(title: "Drop Point", fontSize: Diamentions.font18),
          ],
        ),
      ),
    );
  }
}
