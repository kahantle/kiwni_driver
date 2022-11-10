import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TripsProvider extends ChangeNotifier {
  bool? isSwitchOn;
  bool? isDialogShown;
  bool? isListToBeDisplayed;
  TripsProvider() {
    isSwitchOn = false;
    isDialogShown = false;
    isListToBeDisplayed = false;
  }
  // set true/false when switch is on or off
  changeSwitchMode(bool isSwitchOn) {
    this.isSwitchOn = isSwitchOn;
    notifyListeners();
  }

  // returns value of switch true/false
  getSwitchMode() {
    return isSwitchOn;
  }

  //returns true false according to initial dialog in HomeScreen is displayed or not
  getIsDialogShown() {
    return isDialogShown;
  }

  //set dialog to value true when dialog's dismiss button is clciked
  // set dialog to value false after 3 secs of green circle is hidden
  setIsDialogShown(bool isDialogShown) {
    this.isDialogShown = isDialogShown;
    notifyListeners();
  }

  // set listview  true to display true when after 3 secs of green circle is hidden
  //set listview to false when switch is either on or off
  showTripList(bool isListToBeDisplayed) {
    this.isListToBeDisplayed = isListToBeDisplayed;
    notifyListeners();
  }

  // return showTripList value
  getShowTripList() {
    return isListToBeDisplayed;
  }
}

final tripsProvider =
    ChangeNotifierProvider.autoDispose<TripsProvider>((ref) => TripsProvider());
