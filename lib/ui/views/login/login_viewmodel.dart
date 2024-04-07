import 'package:my_first_app/app/app.locator.dart';
import 'package:my_first_app/app/app.router.dart';
import 'package:my_first_app/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  String _username = '';
  String _password = '';

  String get username => _username;
  String get password => _password;

  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();
  // 更新用户名
  void updateUsername(String value) {
    _username = value;
  }

  // 更新密码
  void updatePassword(String value) {
    _password = value;
  }

  Future runLoginLogic() async {
    // 2. Check if the user is logged in
    if (_authenticationService.userLoggedIn(_username, _password)) {
      // 3. Navigate to HomeView
      _navigationService.replaceWith(Routes.homeView);
    } else {
      // 4. Or navigate to LoginView
      _navigationService.replaceWith(Routes.loginView);
    }
  }
}
