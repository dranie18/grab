import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'LoginPresenter.dart';

class SignUp extends StatefulWidget {
  PageController pageController;
  LoginPresenter _presenter;
  SignUp(this.pageController, this._presenter);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _mail, _pass, _pasconf, _name;

  bool _notEmail = false;
  bool _notPass = false;
  bool _notPassConf = false;
  File _image;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: SingleChildScrollView(
            child: Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              openCamera();
            },
            child: CircleAvatar(
                radius: 80,
                child: _image == null
                    ? ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.all(Radius.circular(80)),
                        child: Image.asset(
                          "assets/images/banner.png",
                          fit: BoxFit.fill,
                          height: 160,
                          width: 160,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(80)),
                        clipBehavior: Clip.antiAlias,
                        child: Image.file(
                          _image,
                          fit: BoxFit.fill,
                          height: 160,
                          width: 160,
                        ),
                      )),
          ),
          SizedBox(
            height: 18,
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.black87)]),
            padding: EdgeInsets.only(top: 13, bottom: 13, left: 15),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.perm_identity,
                  ),
                ),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      _name = value;
                    },
                    decoration: InputDecoration.collapsed(hintText: "Tên"),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.black87)]),
            padding: EdgeInsets.only(top: 13, bottom: 13, left: 15),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.contact_mail,
                  ),
                ),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      _mail = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration.collapsed(hintText: "Email"),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
              height: 18,
              padding: EdgeInsets.only(right: 15),
              alignment: Alignment(1, 0),
              child: Visibility(
                child: Text(
                  "Email không đúng!",
                  style: TextStyle(color: Colors.red),
                ),
                visible: _notEmail,
              )),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.black87)]),
            padding: EdgeInsets.only(top: 13, bottom: 13, left: 15),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.lock_outline,
                  ),
                ),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      _pass = value;
                    },
                    obscureText: true,
                    maxLines: 1,
                    decoration: InputDecoration.collapsed(
                        hintText: "Password"
                            ""),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 15),
            alignment: Alignment.topRight,
            child: Visibility(
              child: Text(
                "Mật khẩu không đúng ! ",
                style: TextStyle(color: Colors.red),
              ),
              visible: _notPass,
            ),
            height: 18,
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.black87)]),
            padding: EdgeInsets.only(top: 13, bottom: 13, left: 15),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.lock,
                  ),
                ),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      _pasconf = value;
                    },
                    decoration: InputDecoration.collapsed(
                        hintText: "Confirm "
                            "Password"),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 15),
            alignment: Alignment.topRight,
            child: Visibility(
              child: Text(
                "Mật khẩu không khớp ! ",
                style: TextStyle(color: Colors.red),
              ),
              visible: _notPassConf,
            ),
            height: 18,
          ),
          GestureDetector(
            onTap: () {
              signIn();
            },
            child: Container(
              height: 45,
              alignment: Alignment(0, 0),
              width: double.infinity,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(18))),
              child: Text(
                "Đăng ký",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Có tài khoản ? ",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                GestureDetector(
                  onTap: () {
                    widget.pageController.jumpToPage(0);
                  },
                  child: Text(
                    "Đăng nhập",
                    style: TextStyle(
                        color: Colors.green, fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    )));
  }

  void openCamera() async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  void signIn() {
    if (checkEmail() && checkPass() && checkPassConf()) {
      widget._presenter.signIn({
        "email": _mail,
        "password": _pass,
        "name": "",
        "picture": "",
        "role": ""
      });
    }
  }

  checkEmail() {
    if (!_mail.contains('@')) {
      setState() {
        _notEmail = true;
      }
    }
    return _mail.contains('@');
  }

  checkPass() {
    if (_pass.length < 6) {
      setState(() {
        _notPass = true;
      });
    }
    return _pass.length >= 6;
  }

  checkPassConf() {
    if (_pass != _pasconf) {
      setState(() {
        _notPassConf = true;
      });
    }
    return _pass == _pasconf;
  }
}
