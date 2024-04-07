class AuthenticationService {
  // 模拟用户登录验证，接收用户名和密码作为参数
  //接受用户名和密码作为参数

  bool userLoggedIn(String username, String password) {
    // 这里模拟登录成功，如果用户名和密码符合条件，则返回 true
    return username.length >= 5 &&
        password.length >= 8 &&
        password.contains(RegExp(r'[a-zA-Z0-9]')) &&
        password.contains(RegExp(r'[A-Z]')) &&
        password.contains(RegExp(r'[0-9]'));
  }
}
