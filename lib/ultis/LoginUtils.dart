//import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginUtils {
  static Future loginWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    GoogleSignInAccount result = await _googleSignIn.signIn();
    GoogleSignInAuthentication authentication = await result.authentication;
    print(authentication.accessToken);
    return Future.value({"status": "ok", "result": authentication.accessToken});
  }

  static Future loginWithFacebook() async {
    final facebookLogin = FacebookLogin();
    FacebookLoginResult result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        {
          print(result.accessToken.token);
          return Future.value(
              {"status": "ok", "result": result.accessToken.token});
        }
      case FacebookLoginStatus.cancelledByUser:
        {
          return Future.value({"status": "Cancenled", "result": "Cancenled"});
        }

      case FacebookLoginStatus.error:
        {
          print("error " + result.errorMessage);
          return Future.error(
              {"status": "error", "result": result.errorMessage});
        }
    }
  }
}
