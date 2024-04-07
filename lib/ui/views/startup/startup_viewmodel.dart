import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:my_first_app/app/app.locator.dart';
import 'package:my_first_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  runStartupLogic() {
    // 显示启动界面
    // 这里使用 Future.delayed 来延迟一段时间
    // 你也可以使用 Timer 来实现相同的效果
    Future.delayed(Duration(milliseconds: 1200), () {
      // 3 秒后跳转到登录界面
      _navigationService.navigateTo(Routes.homeView);
    });
  }
}
