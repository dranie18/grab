import 'dart:async';

import 'package:adhara_socket_io/manager.dart';
import 'package:adhara_socket_io/options.dart';
import 'package:adhara_socket_io/socket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grab_demo/features/driver/driver_nhan_quoc/DriverNhanQuoc.dart';
import 'package:grab_demo/ultis/IntentUltis.dart';
import 'package:grab_demo/ultis/common.dart';
import 'package:location/location.dart';

class DriverHome extends StatefulWidget {
  List listMarker = new List();
  SocketIOManager manager = SocketIOManager();
  SocketIO socket;
  String _curentRoad = "Vị trí ghim";
  GlobalKey<ScaffoldState> scaffoldKey;
  void setSocket() async {
    socket = await manager.createInstance(SocketOptions(
      "http://1.2.3.127:9000/",
    ));
    socket.connect();
//    socket.on("location1", (value) {
//      print(value);
//    });
  }

  DriverHome() {
    scaffoldKey = new GlobalKey();
  }

  @override
  _DriverHomeState createState() {
    setSocket();
    return _DriverHomeState();
  }
}

class _DriverHomeState extends State<DriverHome> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set();
  var isMove = false;
  Location _location;
  String _diaChiDen;

  _DriverHomeState() {
    _location = new Location();
    _location.getLocation().then((onValue) {
//      widget.socket.on("location", (value) {
////        print("demo 333333");
//      });
      _goToNewYork(onValue.latitude, onValue.longitude);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  _onMapCreated(GoogleMapController controller) {
    if (!_controller.isCompleted) {
      _controller.complete(controller);
    }
  }

  _goToNewYork(lattitude, longtitude) async {
    GoogleMapController googleMapController = await _controller.future;
    if (googleMapController != null) {
      googleMapController.animateCamera(
          CameraUpdate.newLatLngZoom(LatLng(lattitude, longtitude), 15));
    }
  }

  CameraPosition _cameraPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(37, 40, 49, 1),
        brightness: Brightness.dark,
        leading: GestureDetector(
          onTap: () {
            widget.scaffoldKey.currentState.openDrawer();
          },
          child: Icon(
            Icons.list,
            color: Colors.white,
          ),
        ),
        title: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                alignment: Alignment(0, 0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Common.IS_ABLE_CHECK_DETAIL =
                          !Common.IS_ABLE_CHECK_DETAIL;
                    });
                  },
                  child: Container(
                    width: 70,
                    padding: EdgeInsets.all(2),
                    decoration: Common.IS_ABLE_CHECK_DETAIL
                        ? BoxDecoration(
                            border: Border.all(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.grey[300]),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          )
                        : BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Color.fromRGBO(37, 40, 49, 1),
                            boxShadow: [
                                BoxShadow(
                                    color: Colors.green,
                                    spreadRadius: 2,
                                    blurRadius: 1),
                              ]),
                    child: Icon(
                      Icons.power_settings_new,
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
              Container(
                  child: Switch(
                value: Common.IS_ABLE_ACCEPT_JOP,
                activeColor: Colors.white,
                inactiveThumbColor: Colors.grey,
                onChanged: (value) {
                  setState(() {
                    Common.IS_ABLE_ACCEPT_JOP = !Common.IS_ABLE_ACCEPT_JOP;
                  });
                },
              )),
            ],
          ),
        ),
      ),
      key: widget.scaffoldKey,
      drawer: Drawer(
        elevation: 2,
        child: Container(
            color: Color.fromRGBO(37, 40, 49, 1),
            child: ListView(
              children: <Widget>[
                Container(
                  color: Color.fromRGBO(54, 58, 69, 1),
                  height: 250,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            border: Border.all(width: 3, color: Colors.white)),
                        width: 100,
                        height: 100,
                        child: CircleAvatar(
                          child: Image.asset(
                            "asstes/images/default_avatar.jpg",
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Nguyễn Văn Tuấn",
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Color.fromRGBO(86, 93, 107, 1)),
                          margin: EdgeInsets.all(15),
                          child: Text(
                            "Thông tin cá nhân",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(7),
                  onTap: () {},
                  title: Text(
                    "Lịch sử",
                    style: getTextStyle(),
                  ),
                  leading: Icon(
                    Icons.history,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(7),
                  onTap: () {},
                  title: Text(
                    "Ví tài sế",
                    style: getTextStyle(),
                  ),
                  leading: Icon(
                    Icons.account_balance_wallet,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(7),
                  onTap: () {},
                  title: Text(
                    "Tiền Thưởng",
                    style: getTextStyle(),
                  ),
                  leading: Icon(
                    Icons.payment,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(7),
                  onTap: () {},
                  title: Text(
                    "Yêu cầu đặt và đã nhận",
                    style: getTextStyle(),
                  ),
                  leading: Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(7),
                  onTap: () {},
                  title: Text(
                    "Blog",
                    style: getTextStyle(),
                  ),
                  leading: Icon(
                    Icons.speaker_notes,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(7),
                  onTap: () {},
                  title: Text(
                    "Hỗ trợ",
                    style: getTextStyle(),
                  ),
                  leading: Icon(
                    Icons.room_service,
                    color: Colors.white,
                  ),
                ),
              ],
            )),
      ),
      body: Container(
        color: Color.fromRGBO(37, 40, 49, 1),
        child: Column(children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      GoogleMap(
                        myLocationEnabled: true,
                        onCameraMove: ((value) {
                          _cameraPosition = value;
                          setState(() {
                            isMove = true;
                          });
                        }),
                        onCameraIdle: () {
                          setState(() {
                            isMove = false;
                          });
                        },
                        markers: _markers,
                        onMapCreated: _onMapCreated,
                        mapType: MapType.terrain,
                        myLocationButtonEnabled: true,
                        initialCameraPosition: new CameraPosition(
                            target: LatLng(20.997878, 105.794916), zoom: 15),
                      ),
                      isMove
                          ? Padding(
                              padding: EdgeInsets.only(bottom: 30),
                              child: Image.asset(
                                "assets/images/hdpi/ic_nav_pickup.png",
                                height: 50,
                                width: 50,
                                fit: BoxFit.fill,
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.only(bottom: 25),
                              child: Image.asset(
                                "assets/images/hdpi/ic_nav_pickup.png",
                                height: 50,
                                width: 50,
                                fit: BoxFit.fill,
                              ),
                            ),
                      Stack(
                        children: <Widget>[
                          SizedBox(
                            child: FlatButton(
                              onPressed: () {
//                                _location.onLocationChanged().listen((onData) {
//                                  widget.socket.emit("location", [
//                                    {
//                                      "lat": onData.latitude,
//                                      "lng": onData.longitude
//                                    }
//                                  ]);
//                                });
                                IntentUtils.changeScreenNomal(
                                    context, DriverNhanQuoc());
                              },
                              child: Container(
                                child: Text("Nhận cuốc"),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  getTextStyle() {
    return TextStyle(color: Colors.white, fontSize: 17);
  }
}
