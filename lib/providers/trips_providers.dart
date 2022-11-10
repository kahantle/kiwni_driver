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
  changeSwitchMode(bool isSwitchOn) {
    this.isSwitchOn = isSwitchOn;
    notifyListeners();
  }

  getSwitchMode() {
    return isSwitchOn;
  }

  getIsDialogShown() {
    return isDialogShown;
  }

  setIsDialogShown(bool isDialogShown) {
    this.isDialogShown = isDialogShown;
    notifyListeners();
  }

  showTripList(bool isListToBeDisplayed) {
    this.isListToBeDisplayed = isListToBeDisplayed;
    notifyListeners();
  }

  getShowTripList() {
    return isListToBeDisplayed;
  }
}

final tripsProvider =
    ChangeNotifierProvider.autoDispose<TripsProvider>((ref) => TripsProvider());
