import 'package:flutter/material.dart';
import 'package:my_first_app/app/app.dialogs.dart';
import 'package:my_first_app/app/app.locator.dart';
import 'package:my_first_app/ui/widgets/common/tagmention/tagmention.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MyBottomNavigationBarModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void onTabChange(int index) {
    // Add this line for debugging
    print('Selected: $index');
    rebuildUi();
  }

  // void onTabSelectedCallback() {
  //   print('Selecteduuu: $selectedIndex');
  // }
}
