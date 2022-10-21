import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/Dimentions.dart';
import '../../utils/colors_helper.dart';
import '../../utils/constants.dart';
import '../../widgets/text.dart';

class KiwniMoney extends StatefulWidget {
  const KiwniMoney({Key? key}) : super(key: key);

  @override
  State<KiwniMoney> createState() => _KiwniMoneyState();
}

class _KiwniMoneyState extends State<KiwniMoney> {
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
                    title: Constants.KIWNI_MONEY,
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
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: Diamentions.width60,
                      ),
                      Container(
                        width: Diamentions.screenWidth,
                        height: 50,
                        child: CustomText(
                          alignment: TextAlign.start,
                          title: Constants.WALLET,
                          fontSize: Diamentions.font18,
                          fontWeight: FontWeight.bold,
                          fontColor: ColorsHelper.blackColor,
                        ),
                      ),
                      SizedBox(
                        height: Diamentions.width30,
                      ),
                      Container(
                        width: Diamentions.screenWidth,
                        height: Diamentions.width140,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xff3b5cfe), Color(0xffc10dec)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(Diamentions.width10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      title: Constants.KIWNI_CASH,
                                      fontSize: Diamentions.font16,
                                      fontColor: ColorsHelper.whiteColor,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: Diamentions.width25,
                                      color: ColorsHelper.blackColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const Divider(
                              height: 1,
                              color: ColorsHelper.blackColor,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(Diamentions.width10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      title: Constants.TOTAL_WALLET_CASH,
                                      fontSize: Diamentions.font16,
                                      fontColor: ColorsHelper.whiteColor,
                                    ),
                                    Container(
                                      height: Diamentions.width40,
                                      width: Diamentions.width90,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              color: ColorsHelper.primaryColor),
                                          color: ColorsHelper.whiteColor),
                                      child: Center(
                                        child: CustomText(
                                          title: Constants.ADD_CASH,
                                          fontSize: Diamentions.font14,
                                          fontColor: ColorsHelper.blackColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Diamentions.width90,
                      ),
                      CustomText(
                        alignment: TextAlign.start,
                        title: Constants.GET_HELP,
                        fontSize: Diamentions.font18,
                        fontWeight: FontWeight.bold,
                        fontColor: ColorsHelper.blackColor,
                      ),
                      SizedBox(
                        height: Diamentions.width40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            title: Constants.FREQUENTLY_ASKED_QUESTIONS,
                            fontSize: Diamentions.font18,
                            fontColor: ColorsHelper.blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: Diamentions.width25,
                            color: ColorsHelper.blackColor,
                          )
                        ],
                      ),
                      SizedBox(
                        height: Diamentions.width20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            title: Constants.TERMS_AND_CONDIITONS,
                            fontSize: Diamentions.font18,
                            fontColor: ColorsHelper.blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: Diamentions.width25,
                            color: ColorsHelper.blackColor,
                          )
                        ],
                      )
                    ],
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
