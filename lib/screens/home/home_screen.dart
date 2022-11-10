import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:kiwni_driver/providers/trips_providers.dart';
import 'package:kiwni_driver/screens/drawer/drawer_item.dart';
import 'package:kiwni_driver/screens/tab_fragments/account.dart';
import 'package:kiwni_driver/screens/tab_fragments/incentive.dart';
import 'package:kiwni_driver/screens/tab_fragments/support.dart';
import 'package:kiwni_driver/utils/Dimentions.dart';
import 'package:kiwni_driver/utils/colors_helper.dart';
import 'package:kiwni_driver/utils/images_helper.dart';
import 'package:kiwni_driver/widgets/rounded_button.dart';

import '../../utils/constants.dart';
import '../../widgets/text.dart';
import '../tab_fragments/trips1.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final list = [
    Constants.TITLE2,
    Constants.TITLE3,
    Constants.TITLE4,
    Constants.TITLE5
  ];
  int _selectedIndex = 0;
  //bool? switchValue;
  bool? isDialogClosed;
  Color headerBackgroundColor = Colors.grey;
  List<Widget> _children = [];
  @override
  void initState() {
    // TODO: implement initState
    // switchValue = false;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _children = [
      TripsFragment1(),
      AccountFragment(),
      IncentiveFragment(),
      SupportFragment(),
    ];
    if (context.read(tripsProvider).getSwitchMode() && _selectedIndex == 0)
      Future.delayed(Duration.zero, () => _showDialog(context));
    var scaffoldKey = GlobalKey<ScaffoldState>();
    Widget buildSpecialAndroidSwitch() => SizedBox(
          width: Diamentions.width120,
          height: Diamentions.width100,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Consumer(
              builder: (context, watch, _) {
                var providerModel = watch(tripsProvider);
                return Switch(
                    trackColor:
                        context.read(tripsProvider).getSwitchMode() == true
                            ? MaterialStateProperty.all(Colors.green)
                            : MaterialStateProperty.all(Colors.black38),

                    // thumb colors
                    activeColor: Colors.green.withOpacity(0.4),
                    inactiveThumbColor: Colors.grey.withOpacity(0.4),
                    activeThumbImage: AssetImage(
                      ImagesHelper.IMG_CAB,
                    ),
                    inactiveThumbImage: AssetImage(ImagesHelper.IMG_CAB),
                    value: context.read(tripsProvider).getSwitchMode(),
                    onChanged: (value) {
                      setState(() {
                        providerModel.changeSwitchMode(value);
                        providerModel.showTripList(false);
                        headerBackgroundColor =
                            value ? Colors.blue : Colors.grey;
                      });
                      // this.switchValue = value;
                    });
              },
            ),
          ),
        );
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: _selectedIndex != 3
                ? Container(
                    width: Diamentions.screenWidth,
                    height: Diamentions.width100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        color: headerBackgroundColor),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: Diamentions.width30,
                          left: Diamentions.width10,
                          right: Diamentions.width10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              print("KJKJKJK");
                              scaffoldKey.currentState!.openDrawer();
                            },
                            child: Container(
                              child: CircleAvatar(
                                backgroundColor: ColorsHelper.whiteColor,
                                child: Icon(
                                  Icons.person,
                                  size: Diamentions.width40,
                                ),
                              ),
                            ),
                          ),
                          buildSpecialAndroidSwitch(),
                          Icon(
                            Icons.notifications,
                            size: Diamentions.width50,
                            color: ColorsHelper.whiteColor,
                          )
                        ],
                      ),
                    ),
                  )
                : Container(
                    width: Diamentions.screenWidth,
                    height: Diamentions.width100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        color: _selectedIndex != 3
                            ? ColorsHelper.greyColor
                            : ColorsHelper.primaryColor),
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
                            title: Constants.SUPPORT_CENTER,
                            fontSize: Diamentions.font18,
                            fontColor: ColorsHelper.whiteColor,
                          )
                        ],
                      ),
                    ),
                  ),
          ),
          Positioned(
            top: Diamentions.width100,
            bottom: 0,
            child: Container(
              child: _children.elementAt(_selectedIndex),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.withOpacity(.60),
          unselectedLabelStyle: TextStyle(
              fontSize: Diamentions.font12, color: ColorsHelper.greyColor),
          selectedFontSize: Diamentions.font12,
          unselectedFontSize: Diamentions.font12,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.archive_rounded),
              label: Constants.TRIPS,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_travel),
              label: Constants.ACCOUNT,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_task),
              label: Constants.INCENTIVE,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: Constants.SUPPORT_CENTER,
            ),
          ]),
      drawer: Drawer(
        backgroundColor: ColorsHelper.primaryColor,
        child: DrawerItem(),
      ),
    );
  }

  void _showDialog(BuildContext context) async {
    showDialog(
        barrierDismissible: false,
        barrierColor: Color(0xe5eef2f5),
        context: context,
        builder: (context) => AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: Consumer(
                builder: (context, watch, _) {
                  var providerModel = watch(tripsProvider);
                  return Container(
                    width: Diamentions.width350,
                    height: Diamentions.width350,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: Diamentions.screenWidth,
                          height: Diamentions.width100,
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
                          height: Diamentions.width30,
                        ),
                        Container(
                          width: Diamentions.screenWidth,
                          child: Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: list.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: Diamentions.screenWidth,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.circle,
                                                color:
                                                    ColorsHelper.primaryColor,
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
                                                  fontColor:
                                                      ColorsHelper.blackColor,
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
                        ),
                        SizedBox(
                          height: Diamentions.width30,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
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
                              onTap: () async {
                                providerModel.setIsDialogShown(true);
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ));
  }
}
