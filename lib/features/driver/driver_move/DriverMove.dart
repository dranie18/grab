import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverMove extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var switchValue = false;
    return Scaffold(
      backgroundColor: Color.fromRGBO(54, 58, 69, 1),
      appBar: AppBar(
        elevation: 4,
        automaticallyImplyLeading: false,
        brightness: Brightness.dark,
        backgroundColor: Color.fromRGBO(54, 58, 69, 1),
        centerTitle: true,
        title: Container(
          height: 80,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  "DROP-OFF",
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
              ),
              Container(
                child: Text(
                  "Tìm",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 50),
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Học Viện Công nghệ Bưu Chính Viễn Thông - PTIT",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15, right: 15),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            "GRAB-CAR",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 2, left: 5, right: 5, bottom: 2),
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            "SGD 6",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          color: Color.fromRGBO(201, 206, 217, 1),
                          padding: EdgeInsets.only(
                              top: 2, left: 5, right: 5, bottom: 2),
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            "CASH",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Container(
                          color: Color.fromRGBO(250, 197, 80, 1),
                          padding: EdgeInsets.only(
                              top: 2, left: 5, right: 5, bottom: 2),
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            "PROMO",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: GoogleMap(
                initialCameraPosition: initCameraPosition(),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              FloatingActionButton(
                                heroTag: "1",
                                onPressed: () {},
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                                backgroundColor: Color.fromRGBO(37, 40, 49, 1),
                                elevation: 0,
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  "Call",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              FloatingActionButton(
                                heroTag: "2",
                                onPressed: () {},
                                child: Icon(
                                  Icons.chat,
                                  color: Colors.white,
                                ),
                                backgroundColor: Color.fromRGBO(37, 40, 49, 1),
                                elevation: 0,
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  "Chat",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              FloatingActionButton(
                                heroTag: "3",
                                onPressed: () {},
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                                backgroundColor: Color.fromRGBO(37, 40, 49, 1),
                                elevation: 0,
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  "Hủy",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Switch(
                                onChanged: (value) {},
                                value: switchValue = false,
                                inactiveThumbColor: Colors.grey,
                                activeColor: Colors.green,
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  "Call",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            width: 150,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Text(
                              "I'M HERE",
                              style: TextStyle(
                                  fontFamily: "FontGrabMedium",
                                  color: Colors.lightBlueAccent),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Text(
                                "PICK-UP",
                                style: TextStyle(
                                    fontFamily: "FontGrabMedium",
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  initCameraPosition() {
    return CameraPosition(target: LatLng(21.054305, 105.735087), zoom: 15);
  }
}
