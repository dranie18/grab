import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'book_vechicle_contract.dart';
import 'book_vehicle_presenter.dart';
import 'goi_xe.dart';

BookVehiclePresenter _presenter;

class BookVehicle extends StatefulWidget {
  PageController _pageController;
  TabController _tabController;

  BookVehicle() {
    _pageController = new PageController(keepPage: true, initialPage: 0);
    _tabController = TabController(length: 2, vsync: AnimatedListState());
  }

  @override
  _BookVehicleState createState() => _BookVehicleState();
}

class _BookVehicleState extends State<BookVehicle>
    implements BookVehicleContract {
  _BookVehicleState() {
    _presenter = new BookVehiclePresenter(this);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.green,
            labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            unselectedLabelColor: Colors.black,
            unselectedLabelStyle:
                TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            onTap: (index) {
              widget._pageController.animateToPage(index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceInOut);
            },
            controller: TabController(length: 2, vsync: AnimatedListState()),
            tabs: <Widget>[
              Tab(
//                text: "Gọi Xe",
                child: Text(
                  "Gọi Xe",
                ),
              ),
              Tab(
                text: "Thuê Xe",
              ),
            ],
          ),
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: widget._pageController,
          children: <Widget>[GoiXe(), ThueXe()],
        ));
  }

  @override
  void showError(mes) {
    Toast.show("ERROR " + mes.toString(), context);
  }

  @override
  void updateData(data) {
    switch (data['key']) {
      case "goixe":
        {
          break;
        }
      case "thuexe":
        {
          break;
        }
    }
  }

  @override
  void upDateRoad(value) {}
}

class ThueXe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[100],
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/hdpi/ic_dynamic_shuttle_on_board.webp",
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text("Đặt xe theo giờ"),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                              "Hãy đặt xe và tài sế đoan trong khoảng thời "
                              "gian của bạn asdk;laklkadfjalkjdlksdfa;"
                              "Hãy đặt xe và tài sế đoan trong khoảng thời "
                              "gian của bạn asdk;laklkadfjalkjdlksdfa;"
                              "Hãy đặt xe và tài sế đoan trong khoảng thời "
                              "gian của bạn asdk;laklkadfjalkjdlksdfa;"
                              "Hãy đặt xe và tài sế đoan trong khoảng thời "
                              "gian của bạn asdk;laklkadfjalkjdlksdfa;"
                              "Hãy đặt xe và tài sế đoan trong khoảng thời "
                              "gian của bạn asdk;laklkadfjalkjdlksdfa;"
                              "lsdkfjasdlfkjasdfasdfasdf;"),
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Tìm hiểu thêm",
                            style: TextStyle(
                                color: Colors.teal[300],
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
            Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, spreadRadius: 2, blurRadius: 8)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment(-1, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/hdpi/ic_onjobnav_pic"
                          "kup_pin_small.png",
                          width: 20,
                          height: 20,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Hãy chọn điểm đến của bạn  "),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(color: Colors.grey, width: 0.5)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).showBottomSheet(
                          (ctx) => BottomSheetView(),
                          elevation: 6);
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      color: Colors.transparent,
                      alignment: Alignment(-1, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            size: 20,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Trong bao lâu ?"),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

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
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image.asset(
                "assets/images/hdpi/abc_spinner_mtrl_am_alpha.9.png"),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 15),
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
                                  padding: EdgeInsets.only(
                                      left: 10, top: 15, bottom: 15),
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: <Widget>[
                                                        Container(
                                                          padding:
                                                              EdgeInsets.only(
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
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.only(
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
                                                                color: Colors
                                                                    .grey),
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
                                                                FontWeight
                                                                    .w700),
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
            ),
          )
        ],
      ),
    );
  }
}
