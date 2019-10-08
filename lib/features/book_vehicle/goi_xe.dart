import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:toast/toast.dart';

import 'bloc_book_vehicle.dart';
import 'book_vehicle_presenter.dart';

class GoiXe extends StatefulWidget {
  List listMarker = new List();
  BlocBookVechicle _bloc;
  BookVehiclePresenter _presenter;

  GoiXe(this._bloc, this._presenter);
  @override
  _GoiXeState createState() {
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
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set();
  var isMove = false;
  Location _location;

  _GoiXeState() {
    _location = new Location();
  }

  initialPosition() {
//    LocationData l = await _location.getLocation();
    return CameraPosition(
        target: LatLng(21.04017802601997, 105.68726520985365), zoom: 15.0);
  }

  _onMapCreated(GoogleMapController controller) {
    if (!_controller.isCompleted) {
      _controller.complete(controller);
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

  _moveToNewYork({lattitude, longtitude}) async {
    double lat = 21.041251;
    double long = 105.688369;
//    widget._presenter.getName({'lat': lat, "long": long});
    if (lattitude != null) lat = lattitude;
    if (longtitude != null) long = longtitude;
    GoogleMapController controller = await _controller.future;
    if (controller != null) {
      controller
          .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), 17));
//      widget._presenter.getName({'lat': lat, "long": long});
    }
  }

  _goToNewYork({lattitude, longtitude}) async {
    double lat = 21.041251;
    double long = 105.688369;
//    widget._presenter.getName({'lat': lat, "long": long});
    if (lattitude != null) lat = lattitude;
    if (longtitude != null) long = longtitude;
    GoogleMapController controller = await _controller.future;
    if (controller != null) {
      controller
          .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), 18));
      widget._presenter.getName({'lat': lat, "long": long});
      setState(() {
        _markers.addAll(widget.listMarker
            .map(
              (item) => Marker(
                infoWindow: InfoWindow(
                  title: item['title'],
                  snippet: item['snippet'],
                  onTap: () {
                    print("demook");
                  },
                ),
                anchor: Offset(0.5, 0.5),
                icon: BitmapDescriptor.fromAsset(
                    "assets/images/hdpi/ic_nav_pickup_sk.png"),
                flat: false,
                markerId: MarkerId(item["id"]),
                position: LatLng(item['la'], item['long']),
              ),
            )
            .toList());
      });
    }
  }

  void changeMap({lattitude, longtitude}) async {
    var position = await _location.getLocation();
    _goToNewYork(lattitude: position.latitude, longtitude: position.longitude);
  }

  @override
  Widget build(BuildContext context) {
    _location.onLocationChanged().listen((currentLocation) {
      print(currentLocation.latitude);
      print(currentLocation.longitude);
      print(currentLocation.accuracy);
      print(currentLocation.altitude);
      print(currentLocation.speed);
      print(currentLocation.speedAccuracy);
      Toast.show(
          "current ${currentLocation.latitude}, ${currentLocation.longitude} speed= ${currentLocation.speed}",
          context);
      _moveToNewYork(
          lattitude: currentLocation.latitude,
          longtitude: currentLocation.longitude);
    });
    return Container(
        child: Column(
      children: <Widget>[
        Expanded(
          child: Stack(
            alignment: Alignment(0, 0),
            children: <Widget>[
              GoogleMap(
                trafficEnabled: true,
                onTap: (value) {
                  _goToNewYork(
                      lattitude: value.latitude, longtitude: value.longitude);
                },
                myLocationEnabled: true,
                onCameraMove: ((value) {
//                  setState(() {
//                    isMove = true;
//                  });
                }),
                onCameraIdle: () {
//                  setState(() {
//                    isMove = false;
//                  });
                },
                markers: _markers,
                onMapCreated: _onMapCreated,
                mapType: MapType.terrain,
                myLocationButtonEnabled: true,
                initialCameraPosition: initialPosition(),
              ),
              isMove
                  ? Image.asset(
                      "assets/images/hdpi/ic_nav_pickup_sk.png",
                      height: 30,
                      width: 30,
                    )
                  : Image.asset(
                      "assets/images/hdpi/ic_nav_pickup.png",
                      height: 30,
                      width: 30,
                    ),
//              FloatingActionButton(
//                onPressed: () {
//                  _goToNewYork();
//                },
//                child: Text("sd"),
//              )
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
                                    snapshot.hasData
                                        ? snapshot.data
                                        : "Vị "
                                            "chí ghim",
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
                            showModalBottomSheet(
                                context: context,
                                builder: (ctx) => ModalBottomSheet(
                                      presenter: widget._presenter,
                                    ));
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

class ModalBottomSheet extends StatefulWidget {
  TextEditingController _textControll;
  ScrollController _scrollController;
  var gimPosotion;
  BookVehiclePresenter presenter;

  ModalBottomSheet({this.gimPosotion, this.presenter}) {}

  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        color: Colors.white,
      ),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 5, bottom: 5, left: 10),
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
                    padding: EdgeInsets.only(top: 5, bottom: 5, left: 10),
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
                    Container(
                        padding: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                        child: Text(
                          widget.gimPosotion != null
                              ? widget.gimPosotion
                              : "Vị"
                                  " trí "
                                  "ghim",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        )),
                    Container(
                      height: 1,
                      width: 350,
                      margin: EdgeInsets.only(left: 15),
                      color: Colors.black,
                    ),
                    Container(
                      width: 350,
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        onSubmitted: (value) {
                          widget._textControll.text = value;
                          widget.presenter.searchByName(value);
                        },
                        controller: widget._textControll,
                        maxLines: 1,
                        maxLength: 30,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                        decoration: InputDecoration(
                          hintText: "Tôi "
                              "muốn đến...",
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            height: 60,
            color: Color.fromRGBO(0, 0, 0, 0.03),
            width: double.infinity,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        size: 25,
                        color: Colors.black38,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Nhà riêng",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          spreadRadius: 1,
                          blurRadius: 4,
                        )
                      ]),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.business_center,
                        size: 25,
                        color: Colors.black38,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Cơ quan",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          spreadRadius: 1,
                          blurRadius: 4,
                        )
                      ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    widget._textControll = new TextEditingController();
    super.initState();
  }
}
