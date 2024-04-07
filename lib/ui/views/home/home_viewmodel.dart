import 'package:my_first_app/app/app.bottomsheets.dart';
import 'package:my_first_app/app/app.dialogs.dart';
import 'package:my_first_app/app/app.locator.dart';
import 'package:my_first_app/app/app.router.dart';
import 'package:my_first_app/ui/common/app_strings.dart';
import 'package:my_first_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vibration/vibration.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  String get counterLabel => 'Counter is: $_counter';
  int _counter = 0;

  int _uuuindex = 0;
  int get uuuindex => _uuuindex;

  void onTabChange(int index) {
    _uuuindex = index; // 将选中的索引值发送到BehaviorSubject中
    print('uuu :$index');
    rebuildUi(); // 通知视图更新,get到上面
  }

  Map<String, double> calculatePosition(double screenWidth) {
    double buttonWidth = screenWidth / 4;
    double fourthButtonLeft = buttonWidth * 3.191;
    double fourthButtonRight = buttonWidth * 0.191;
    double radiusTag = buttonWidth * 0.14; //临界值0.309
    double spaceBetween = buttonWidth * 0.03;
    return {
      'left': fourthButtonLeft,
      'right': fourthButtonRight,
      'radiusTag': radiusTag,
      'spaceBetween': spaceBetween
    };
  }

  bool isVisible = true;

  void hideWidget() {
    isVisible = false;
    notifyListeners();
  }

  void startTimerToHideWidget() {
    // 5秒后隐藏
    Future.delayed(Duration(milliseconds: 140), () {
      hideWidget();
    });
  }

  // double getWidgetWidth() {
  //   int widgetWidth = 100;
  //   widgetWidth = widgetWidth / 2;
  //   // 假设函数返回 widget 的宽度
  //   right();
  // }

  // double right() {
  //   return quarterScreenWidth + widgetWidth;
  //   ;
  // }

  // double left() {
  //   return quarterScreenWidth - widgetWidth;
  // }

  // double quarterScreen = quarterScreenWidth;
  // double widgetWidth = getWidgetWidth();

  // int stuflplace = quarterScreenWidth * 3 - getWidgetWidth / 2;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.alert,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

// 通知界面更新

  // 根据选中的选项卡执行相应的操作

  //   if (uuudIndex == 0) {
  //     onHomeTabSelected();
  //   } else if (uuudIndex == 1) {
  //     onLikesTabSelected();
  //   } else if (uuudIndex == 2) {
  //     onSearchTabSelected();
  //   } else if (uuudIndex == 3) {
  //     onProfileTabSelected();
  //   }
  // }

  // void onHomeTabSelected() {
  //   // 处理首页选项卡被选中的逻辑
  //   print('Home tab selected');
  //   //震动50ms，模拟点击效果
  //   Vibration.vibrate(duration: 50);

  //   // _navigationService.navigateTo(Routes.chatView);
  // }

  // void onLikesTabSelected() {
  //   // 处理喜欢选项卡被选中的逻辑
  //   print('Likes tab selected');
  //   Vibration.vibrate(duration: 50);
  //   // _navigationService.navigateTo(Routes.toDoView);
  // }

  // void onSearchTabSelected() {
  //   // 处理搜索选项卡被选中的逻辑
  //   print('Search tab selected');
  //   Vibration.vibrate(duration: 50);
  //   // _navigationService.navigateTo(Routes.personalBuddyView);
  // }

  // void onProfileTabSelected() {
  //   // 处理个人资料选项卡被选中的逻辑
  //   print('Profile tab selected');
  //   Vibration.vibrate(duration: 50);
  //   // _navigationService.navigateTo(Routes.profileView);
  // }
}
