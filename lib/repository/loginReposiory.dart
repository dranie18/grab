import 'package:grab_demo/ultis/LoginUtils.dart';

class LoginRepository {
  Future loginWithFace() async {
    return LoginUtils.loginWithFacebook();
  }

  loginNomal() {}
  loginWithGoogle() async {
    return LoginUtils.loginWithGoogle();
  }
}
