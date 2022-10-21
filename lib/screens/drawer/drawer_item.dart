import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kiwni_driver/utils/images_helper.dart';

import '../../utils/Dimentions.dart';
import '../../utils/colors_helper.dart';
import '../../utils/constants.dart';
import '../../widgets/text.dart';

class DrawerItem extends StatefulWidget {
  DrawerItem({Key? key}) : super(key: key);

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  _DrawerItemState();
  late int selectedDrawerIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedDrawerIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    _getDrawerItemWidget(int pos) {
      switch (pos) {
        case 0:
          return Get.toNamed("/performance");
        case 2:
          return Get.toNamed("/kiwniMoney");
        default:
          return new Text("Error");
      }
    }

    return Scaffold(
      body: Column(children: <Widget>[
        DrawerHeader(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: Diamentions.width10,
              ),
              Container(
                height: Diamentions.width60,
                width: Diamentions.width60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border:
                        Border.all(color: ColorsHelper.blackColor, width: 1)),
                child: CircleAvatar(
                  backgroundColor: ColorsHelper.whiteColor,
                  radius: 20,
                  child: Icon(
                    Icons.person,
                    size: Diamentions.width50,
                    color: Color(0xffb8c6ff),
                  ),
                ),
              ),
              SizedBox(
                width: Diamentions.width20,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Diamentions.width10,
                      vertical: Diamentions.width10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        title: "Kiran Patil",
                        fontSize: Diamentions.font18,
                        fontWeight: FontWeight.bold,
                        fontColor: ColorsHelper.blackColor,
                      ),
                      CustomText(
                        title: "12345567782",
                        fontSize: Diamentions.font18,
                        fontWeight: FontWeight.bold,
                        fontColor: ColorsHelper.primaryColor,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: ColorsHelper.primaryBackgroundColor,
          ),
        ),
        Expanded(
          child: Container(
            height: Diamentions.screenHeight,
            child: ListView.builder(
                itemCount: drawerItems.length,
                itemBuilder: (context, index) {
                  DrawerItemModel item = drawerItems[index];
                  return Container(
                    width: Diamentions.width100,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Diamentions.width10,
                          vertical: Diamentions.width10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDrawerIndex = index;
                            _getDrawerItemWidget(index);

                            print("drawwer");
                          });
                        },
                        child: Center(
                          child: SizedBox(
                            width: Diamentions.width200,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Diamentions.width10,
                                  vertical: Diamentions.width10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    item.getIcon(),
                                    width: Diamentions.width25,
                                    height: Diamentions.width25,
                                  ),
                                  SizedBox(
                                    width: Diamentions.width10,
                                  ),
                                  Container(
                                    child: CustomText(
                                      title: item.getTitle(),
                                      fontSize: Diamentions.font18,
                                      fontWeight: FontWeight.bold,
                                      fontColor: ColorsHelper.blackColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        )
      ]),
    );
  }
}

///model class
class DrawerItemModel {
  // bool? isRadioButtonFill;
  String? icon;
  String? title;
  DrawerItemModel(
      { //required this.isRadioButtonFill,
      required this.icon,
      required this.title});
  factory DrawerItemModel.fromJson(Map<String, dynamic> json) {
    return DrawerItemModel(
      //   isRadioButtonFill: json['isRadioButtonFill'],
      icon: json['icon'],
      title: json['title'],
    );
  }
  // getIsRadioButton() {
  //   return isRadioButtonFill ?? false;
  // }

  getIcon() {
    return icon;
  }

  getTitle() {
    return title;
  }
}

DrawerItemModel drawerItem1 = DrawerItemModel(
    icon: ImagesHelper.IC_PERFORMANCE, title: Constants.PERFORMANCE);
DrawerItemModel drawerItem2 =
    DrawerItemModel(icon: ImagesHelper.IC_GRP, title: Constants.REFER);
DrawerItemModel drawerItem3 = DrawerItemModel(
    icon: ImagesHelper.IC_KIWNI_MONEY, title: Constants.KIWNI_MONEY);
DrawerItemModel drawerItem4 =
    DrawerItemModel(icon: ImagesHelper.IC_SETTINGS, title: Constants.RATING);
DrawerItemModel drawerItem5 =
    DrawerItemModel(icon: ImagesHelper.IC_EXIT, title: Constants.EXI_TOLA_APP);
List<DrawerItemModel> drawerItems = [
  drawerItem1,
  drawerItem2,
  drawerItem3,
  drawerItem4,
  drawerItem5,
];
