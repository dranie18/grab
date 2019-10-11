import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  PageController pageController;

  SignUp(this.pageController);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            child: CircleAvatar(
              child: Image.asset(
                "assets/images/default_avatar.jpg",
                height: 80,
                width: 80,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              pageController.jumpToPage(0);
            },
            child: Text("đăng nhập"),
          ),
        ],
      ),
    ));
  }
}
