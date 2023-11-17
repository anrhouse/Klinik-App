import 'package:flutter_app/data/helper/user_info.dart';

class LoginService {
  Future<bool> login(String username, String password) async {
    bool isLogin = false;
    if (username == 'admin' && password == 'admin') {
      await UserInfo().setToken("${username}${password}");
      await UserInfo().setUserID("1");
      await UserInfo().setUsername(username);
      isLogin = true;
    }
    return isLogin;
  }
}
