import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class AccountView extends StatelessWidget {
  int _diem = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment(1, 1),
                  margin: EdgeInsets.all(10),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                  child: Stack(
                    children: <Widget>[
                      Image.asset("asstes/images/hdpi/ic_waze_maps.png"),
                      Image.asset(
                          "assets/images/hdpi/ic_onjobnav_pickup_pin_small"
                          ".png"),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Nguyễn Văn Đoàn",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        padding: EdgeInsets.all(5),
                      ),
                      GestureDetector(
                          onTap: () {
                            Toast.show("show chinhr suawrr tai khoan", context);
                          },
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Chỉnh sửa tài khoản",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: Colors.black54),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 12,
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(5),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              pressItem(1);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              height: 40,
              child: Row(
                children: <Widget>[
                  Text("${_diem} Điểm . Ưu đãi cho thành "
                      "viên"),
                  Expanded(
                    child: Container(),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1)),
          ),
          GestureDetector(
            onTap: () {
              pressItem(2);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              height: 40,
              child: Row(
                children: <Widget>[
                  Text("Ưu đãi"),
                  Expanded(
                    child: Container(),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1)),
          ),
          GestureDetector(
            onTap: () {
              pressItem(3);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              height: 40,
              child: Row(
                children: <Widget>[
                  Text("Đã đặt trước"),
                  Expanded(
                    child: Container(),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1)),
          ),
          GestureDetector(
            onTap: () {
              pressItem(4);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              height: 40,
              child: Row(
                children: <Widget>[
                  Text("Gói hội viên"),
                  Expanded(
                    child: Container(),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1)),
          ),
          GestureDetector(
            onTap: () {
              pressItem(5);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              height: 40,
              child: Row(
                children: <Widget>[
                  Text("Điểm đã lưu"),
                  Expanded(
                    child: Container(),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1)),
          ),
          GestureDetector(
            onTap: () {
              pressItem(6);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              height: 40,
              child: Row(
                children: <Widget>[
                  Text("Trung tâm trợ giúp"),
                  Expanded(
                    child: Container(),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1)),
          ),
          GestureDetector(
            onTap: () {
              pressItem(7);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              height: 40,
              child: Row(
                children: <Widget>[
                  Text("Số liên hệ S.O.S"),
                  Expanded(
                    child: Container(),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1)),
          ),
          GestureDetector(
            onTap: () {
              pressItem(8);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              height: 40,
              child: Row(
                children: <Widget>[
                  Text("Lái xe cùng Grab"),
                  Expanded(
                    child: Container(),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1)),
          ),
          GestureDetector(
            onTap: () {
              pressItem(9);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              height: 40,
              child: Row(
                children: <Widget>[
                  Text("Cái đặt"),
                  Expanded(
                    child: Container(),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1)),
          ),
          GestureDetector(
            onTap: () {
              pressItem(10);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              height: 40,
              child: Row(
                children: <Widget>[
                  Text("Chia sẻ phản hổi"),
                  Expanded(
                    child: Container(),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1)),
          ),
        ],
      ),
    ));
  }

  void pressItem(int i) {}
}
