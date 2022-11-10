import 'package:flutter/cupertino.dart';
import 'package:kiwni_driver/utils/Dimentions.dart';
import 'package:kiwni_driver/utils/colors_helper.dart';
import 'package:kiwni_driver/utils/constants.dart';
import 'package:kiwni_driver/widgets/text.dart';

class CompletedTrips extends StatefulWidget {
  const CompletedTrips({Key? key}) : super(key: key);

  @override
  State<CompletedTrips> createState() => _CompletedTripsState();
}

class _CompletedTripsState extends State<CompletedTrips> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: Diamentions.width30,
        ),
        Container(
          width: Diamentions.screenWidth,
          child: CustomText(
            title: Constants.COMPLETED_TRIPS,
            fontSize: Diamentions.font18,
            fontColor: ColorsHelper.blackColor,
            fontFamily: Constants.FONT_FAMILY_BOLD,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: Diamentions.screenWidth,
          child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: Diamentions.screenWidth,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorsHelper.blackColor, width: 1),
                        color: ColorsHelper.lightGreenColor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "12/03/2021",
                            fontSize: Diamentions.font16,
                            fontColor: ColorsHelper.blackColor,
                          ),
                          SizedBox(
                            height: Diamentions.width10,
                          ),
                          CustomText(
                            title: "7:00 to 7:35",
                            fontSize: Diamentions.font16,
                            fontColor: ColorsHelper.blackColor,
                          ),
                          SizedBox(
                            height: Diamentions.width10,
                          ),
                          CustomText(
                            title: "KRN NO:  B39KIWNI",
                            fontSize: Diamentions.font16,
                            fontColor: ColorsHelper.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
