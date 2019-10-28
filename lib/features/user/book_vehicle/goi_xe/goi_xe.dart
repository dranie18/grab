import 'dart:async';

import 'package:adhara_socket_io/manager.dart';
import 'package:adhara_socket_io/options.dart';
import 'package:adhara_socket_io/socket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grab_demo/ultis/common.dart';
import 'package:location/location.dart';

import '../bloc_book_vehicle.dart';
import '../book_vehicle_presenter.dart';
import 'bottom_sheet.dart';

class GoiXe extends StatefulWidget {
  List listMarker = new List();
  BlocBookVechicle _bloc;
  BookVehiclePresenter _presenter;
  SocketIOManager manager = SocketIOManager();
  SocketIO socket;
  String _curentRoad = "Vị trí ghim";
  Completer<GoogleMapController> _controller = Completer();

  void setSocket() async {
    socket = await manager.createInstance(SocketOptions(
      "http://1.2.3.127:9000/",
    ));
    socket.connect();
    socket.on("location", (value) {
      print(value);
      _goToNewYork(value["lat"], value["lng"]);
    });

//    socket.on("chat message", (value) {
//      print("demo1111111111" + value);
//    });
  }

  _goToNewYork(lattitude, longtitude) async {
//      _presenter.getName({'lat': lattitude, "lng": longtitude});
    GoogleMapController googleMapController = await _controller.future;
    if (googleMapController != null) {
      googleMapController.animateCamera(
          CameraUpdate.newLatLngZoom(LatLng(lattitude, longtitude), 15));
//      widget._presenter.getName({'lat': lattitude, "lng": longtitude});
    }
  }

  GoiXe(this._bloc, this._presenter);

  @override
  _GoiXeState createState() {
    setSocket();

    listMarker.addAll([
      {
        'id': '1',
        'la': 21.04017802601997,
        'long': 105.68726520985365,
        'title': "demo",
        'snippet': 'demo_snippet'
      },
      {
        'id': '2',
        'la': 21.040675,
        'long': 105.687746,
        'title': "demo",
        'snippet': 'demo_snippet'
      },
      {
        'id': '3',
        'la': 21.041009,
        'long': 105.688201,
        'title': "demo",
        'snippet': 'demo_snippet'
      },
      {
        'id': '4',
        'la': 21.041242,
        'long': 105.687963,
        'title': "demo",
        'snippet': 'demo_snippet'
      },
    ]);
    return _GoiXeState();
  }
}

class _GoiXeState extends State<GoiXe> {
  Set<Marker> _markers = Set();
  var isMove = false;
  Location _location;
  String _diaChiDen;

  _GoiXeState() {
//    widget.socket.on("location", (value) {
//      _goToNewYork(value["lat"], value["lng"]);
//    });
    _location = new Location();
    _location.getLocation().then((onValue) {
//      widget.socket.on("location", (value) {
////        print("demo 333333");
//      });
      widget._goToNewYork(onValue.latitude, onValue.longitude);
      widget._presenter.postCurrentPosition(
          {"lat": onValue.latitude, "lng": onValue.longitude});
    });
  }

  @override
  void initState() {
    super.initState();
  }

  //  initialPosition() {
//    return CameraPosition(
//        target: LatLng(LocationData()),
//        zoom: 15.0);
//  }

  _onMapCreated(GoogleMapController controller) {
    if (!widget._controller.isCompleted) {
      widget._controller.complete(controller);
    }
//    widget._location.location
//        .onLocationChanged()
//        .listen((Map<String, double> currentLocation) {
//      Toast.show(
//          "current location ${currentLocation["latitude"]},${currentLocation["longitude"]}",
//          context);
//      _goToNewYork(
//          lattitude: currentLocation["latitude"],
//          longtitude: currentLocation["longitude"]);
//    });
  }

//  void changeMap({lattitude, longtitude}) async {
//    var position = await _location.getLocation();
//    _goToNewYork(lattitude: position.latitude, longtitude: position.longitude);
//  }

  CameraPosition _cameraPosition;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  widget._presenter.getName({
                    "lat": _cameraPosition.target.latitude,
                    "lng": _cameraPosition.target.longitude
                  });
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
              FlatButton(
                onPressed: () {
                  Common.USER = 0;
                  if (Common.USER == 0)
                    Timer.periodic(Duration(milliseconds: 500), (value) {
                      widget.socket.emit("location", [
                        {"lat": 111111, "lng": 1111}
                      ]);
                    });
                },
                child: Text("user"),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 5, left: 10),
                        child: Image.asset(
                          "assets/images/hdpi/ic_onjobnav_pickup_pin_small"
                          ".png",
                          fit: BoxFit.fill,
                          height: 18,
                          width: 18,
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.more_vert,
                            color: Colors.black54,
                            size: 18,
                          )),
                      Container(
                        padding: EdgeInsets.only(top: 5, left: 10),
                        child: Image.asset(
                          "assets/images/hdpi/ic_onjobnav_pickup_pin_small"
                          ".png",
                          fit: BoxFit.fill,
                          height: 18,
                          width: 18,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        StreamBuilder(
                            stream: widget._bloc.getStream(),
                            builder: (context, snapshot) => Container(
                                padding: EdgeInsets.only(
                                    top: 15, bottom: 15, left: 15),
                                child: Container(
                                  child: Text(
                                    snapshot.hasData &&
                                            snapshot.data['check'] ==
                                                Common.CURENT_ROAD
                                        ? widget._curentRoad =
                                            snapshot.data["value"]
                                        : widget._curentRoad,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),
                                ))),
                        Container(
                          height: 1,
                          width: 350,
                          margin: EdgeInsets.only(left: 15),
                          color: Colors.black,
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet<dynamic>(
                                elevation: 4,
                                context: context,
                                builder: (ctx) => ModalBottomSheet(
                                        widget._presenter, widget._bloc, {
                                      "lat": _cameraPosition.target.latitude,
                                      "lng": _cameraPosition.target.longitude,
                                      "road": widget._curentRoad
                                    }));
                          },
                          child: Container(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                "Tôi muốn đến...",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
