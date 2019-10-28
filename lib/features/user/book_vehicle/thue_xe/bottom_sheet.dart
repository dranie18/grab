import 'package:flutter/material.dart';

class BottomSheetView extends StatelessWidget {
  List listDemo;

  BottomSheetView() {
    listDemo = new List();

    listDemo.addAll([
      {
        "seaterNum": 4,
        "list": [
          {
            "timeToRent": 2,
            "timeTranfer": 3,
            "seaterNum": 4,
            "cost": 400,
            "note": "Di "
                "chuyển trong HN trong 2 tiếng"
          },
          {
            "timeToRent": 2,
            "timeTranfer": 3,
            "seaterNum": 4,
            "cost": 400,
            "note": "Di "
                "chuyển trong HN trong 2 tiếng"
          },
          {
            "timeToRent": 2,
            "timeTranfer": 3,
            "seaterNum": 4,
            "cost": 400,
            "note": "Di "
                "chuyển trong HN trong 2 tiếng"
          },
          {
            "timeToRent": 2,
            "timeTranfer": 3,
            "seaterNum": 4,
            "cost": 400,
            "note": "Di "
                "chuyển trong HN trong 2 tiếng"
          },
        ]
      },
      {
        "seaterNum": 7,
        "list": [
          {
            "timeToRent": 2,
            "timeTranfer": 3,
            "seaterNum": 4,
            "cost": 400,
            "note": "Di "
                "chuyển trong HN trong 2 tiếng"
          },
          {
            "timeToRent": 2,
            "timeTranfer": 3,
            "seaterNum": 4,
            "cost": 400,
            "note": "Di "
                "chuyển trong HN trong 2 tiếng"
          },
          {
            "timeToRent": 2,
            "timeTranfer": 3,
            "seaterNum": 4,
            "cost": 400,
            "note": "Di "
                "chuyển trong HN trong 2 tiếng"
          },
          {
            "timeToRent": 2,
            "timeTranfer": 3,
            "seaterNum": 4,
            "cost": 400,
            "note": "Di "
                "chuyển trong HN trong 2 tiếng"
          },
        ]
      },
      {
        "seaterNum": 17,
        "list": [
          {
            "timeToRent": 2,
            "timeTranfer": 3,
            "seaterNum": 4,
            "cost": 400,
            "note": "Di "
                "chuyển trong HN trong 2 tiếng"
          },
          {
            "timeToRent": 2,
            "timeTranfer": 3,
            "seaterNum": 4,
            "cost": 400,
            "note": "Di "
                "chuyển trong HN trong 2 tiếng"
          },
          {
            "timeToRent": 2,
            "timeTranfer": 3,
            "seaterNum": 4,
            "cost": 400,
            "note": "Di "
                "chuyển trong HN trong 2 tiếng"
          },
          {
            "timeToRent": 2,
            "timeTranfer": 3,
            "seaterNum": 4,
            "cost": 400,
            "note": "Di "
                "chuyển trong HN trong 2 tiếng"
          },
        ]
      },
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        controller: ScrollController(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 0),
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text("Đặt xe theo giờ",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            color: Colors.black54)),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Cước phí được tính đã bao gồm tiền xăng xe và công tài "
                      "xế",
                      style: TextStyle(fontSize: 13),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: listDemo.map((item) {
                  List subList = item['list'];
                  return Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.only(left: 10, top: 15, bottom: 15),
                          color: Colors.grey[200],
                          width: double.infinity,
                          child: Text(
                            "${item['seaterNum']} seater / "
                            "${item['seaterNum']} chỗ",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                                color: Colors.black54),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: subList
                                .map((map) => Container(
                                      child: Row(
                                        children: <Widget>[
                                          Image.asset(
                                            "assets/images/hdpi/ic_parking_illustration"
                                            ".png",
                                            width: 80,
                                            height: 80,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: 10,
                                                      top: 5,
                                                      bottom: 5),
                                                  child: Text(
                                                    "${map['timeToRent']}"
                                                    " tiếng "
                                                    "${map['sea'
                                                        'terNum']} chỗ",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: 10,
                                                      top: 5,
                                                      bottom: 5),
                                                  child: Text(
                                                    "Di chuyển trong HN "
                                                    "trong vòng "
                                                    "${map['timeToRent']} "
                                                    "tiếng ",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                              child: Row(
                                            children: <Widget>[
                                              Text(
                                                "VND ",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "${map['cost']}K",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w700),
                                              )
                                            ],
                                          ))
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                        )
                      ]));
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
