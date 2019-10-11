import 'dart:convert';

import 'package:grab_demo/repository/loginReposiory.dart';
import 'package:http/http.dart' as http;

import 'LoginContract.dart';

class LoginPresenter {
  final String _uri = "http://1.2.3.116:9000";
  LoginRepository _loginRepository;
  LoginContract loginContract;
  LoginPresenter(this._loginRepository, this.loginContract);

  void loginNomal(value) {
    http
        .post(_uri + "/auth",
            body: {"email": value['email'], "password": value['password']},
            encoding: Encoding.getByName("text/json"))
        .then((reponse) {
      if (reponse.statusCode == 201) {
        loginContract
            .loginStatus({"status": 1, "mess": "Đăng nhập thành công"});
        print(reponse.body);
      } else {
        loginContract.loginStatus({
          "status": 0,
          "mess": "Đăng nhập thất "
              "bại"
        });
      }
    });
  }

  void loginWithFacebook() {
    _loginRepository.loginWithFace().then((value) {
      if (value['status'] == "ok") {
        http
            .post(_uri + "/auth/facebook?access_token=${value['result']}")
            .then((reponse) {
//          if (reponse.statusCode == 201) {
//            loginContract
//                .loginStatus({"status": 1, "mess": "Đăng nhập thành công"});
          print("reponse  ${reponse.statusCode}  " + reponse.body);
//          } else {
//            loginContract.loginStatus({
//              "status": 0,
//              "mess": "Đăng nhập thất "
//                  "bại"
//            });
//          }
        });
        print(value['result']);
      }
    }).catchError((error) {
      print(error);
    });
  }

  void loginWithGoogle() {
    _loginRepository.loginWithGoogle().then((value) {
      if (value['status'] == "ok") {
        http
            .post(_uri + "/auth/google" + "?access_token=${value['result']}")
            .then((reponse) {
//          if (reponse.statusCode == 201) {
//            loginContract
//                .loginStatus({"status": 1, "mess": "Đăng nhập thành công"});
          print(reponse.body);
//          } else {
//            loginContract.loginStatus({
//              "status": 0,
//              "mess": "Đăng nhập thất "
//                  "bại"
//            });
//          }
        });
        print(value['result']);
      }
    }).catchError((error) {
      print(error);
    });
  }
}
