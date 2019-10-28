import 'package:flutter/material.dart';
import 'package:grab_demo/features/driver/driver_move/DriverMove.dart';
import 'package:grab_demo/ultis/IntentUltis.dart';

class DriverNhanQuoc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(52, 56, 67, 1),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10, left: 15, right: 15),
              margin: EdgeInsets.only(top: 70),
              height: 80,
              alignment: Alignment(0, 0),
              child: Text(
                "VND 15.000 đ",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Column(
                children: <Widget>[
                  Container(
                    color: Color.fromRGBO(234, 239, 242, 1),
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "1.9Km",
                          style: getTextStyle(),
                        ),
                        Text(
                          "GRABPAY",
                          style: getTextStyle(),
                        ),
                        Text(
                          "PROMO",
                          style: getTextStyle(),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                width: double.infinity,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      child: Text("ĐIỂM ĐẦU"),
                                    ),
                                    Container(
                                      child: Text(
                                        "ĐCT08 Mễ Trì, Từ Liêm, Hà Nội, Việt Nam",
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Color.fromRGBO(234, 239, 242, 1),
                                padding: EdgeInsets.all(10),
                                width: double.infinity,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      child: Text("ĐIỂM CUỐI"),
                                    ),
                                    Container(
                                      child: Text(
                                        "ĐCT08 Mễ Trì, Từ Liêm, Hà Nội, Việt Nam",
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Image.asset(
                            "assets/images/move.png",
                            height: 25,
                            width: 25,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    alignment: Alignment(0, 0),
                    child: Text(
                      "VND 15.000 đ",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                margin: EdgeInsets.all(15),
                child: Stack(
                  alignment: Alignment(1, 0),
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        IntentUtils.changeScreenNomal(context, DriverMove());
                      },
                      child: Container(
                        alignment: Alignment(0, 0),
                        width: double.infinity,
                        color: Colors.green,
                        child: Text(
                          "Nhận Quốc",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "FontGrabMedium"),
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color.fromRGBO(0, 142, 51, 1)),
                      child: Text(
                        "4",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "FontGrabMedium",
                            fontSize: 15),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  getTextStyle() {
    return TextStyle(
      color: Colors.grey,
    );
  }
}
