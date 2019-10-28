import 'package:flutter/material.dart';
import 'package:grab_demo/features/user/home_view/payment/patment.dart';

import 'account/account_view.dart';
import 'activities/activity_view.dart';
import 'home/home_view.dart';
import 'mail_box/mail_view.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainViewState();
  }
}

class _MainViewState extends State<MainView> {
  int _curentIndex = 0;
  PageController _pageController;

  _MainViewState() {
    _pageController = new PageController(keepPage: true, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
          child: Stack(
        children: <Widget>[
          PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: <Widget>[
              HomeScreen(),
              ActivityScreen(),
              PaymentView(),
              MailView(),
              AccountView(),
            ],
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _pageController.jumpToPage(index);
//                duration: Duration(milliseconds: 0), curve: Curves.bounceInOut);
            _curentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                "Trang chủ",
                style: TextStyle(fontSize: 10),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_activity),
              title: Text(
                "Hoạt dộng",
                style: TextStyle(fontSize: 10),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              title: Text("Thanh toán", style: TextStyle(fontSize: 10))),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail_outline),
              title: Text("Hộp thư", style: TextStyle(fontSize: 10))),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervisor_account),
              title: Text("Tài khoản", style: TextStyle(fontSize: 10))),
        ],
        currentIndex: _curentIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 4,
        selectedFontSize: 13,
        unselectedFontSize: 12,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  TextStyle bottomBarStyle() {
    return TextStyle(fontSize: 14);
  }
}
