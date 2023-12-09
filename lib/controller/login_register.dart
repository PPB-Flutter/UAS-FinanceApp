// class for login and register controller
class LoginRegisterController {
  bool _isLogin = true;
  bool get isLogin => _isLogin;
  bool get isRegister => !_isLogin;

  set isLogin(bool value) {
    _isLogin = value;
  }

  void toggleIsLogin() {
    _isLogin = !_isLogin;
  }

  void toggleIsRegister() {
    _isLogin = !_isLogin;
  }

  void loginCallback(String email, String password) {
    print("Login $email $password");
  }

  void registerCallback(String email, String password) {
    print("Register $email $password");
  }
}
