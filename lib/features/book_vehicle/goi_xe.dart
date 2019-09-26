import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoiXe extends StatefulWidget {
  List listMarker = new List();

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
  initialPosition() {
    return CameraPosition(target: LatLng(21.044708, 105.741100), zoom: 15.0);
  }

  _onMapCreated(GoogleMapController controller) {
    if (!_controller.isCompleted) {
      _controller.complete(controller);
    }
  }

  _goToNewYork({lattitude, longtitude}) async {
    double lat = 21.041251;
    double long = 105.688369;
    if (lattitude != null) lat = lattitude;
    if (longtitude != null) long = longtitude;
    GoogleMapController controller = await _controller.future;
    if (controller != null) {
      controller
          .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), 18));

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
    var position = await Location().getLocation();
    _goToNewYork(lattitude: position.latitude, longtitude: position.longitude);
  }

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
                onTap: (value) {
                  _goToNewYork(
                      lattitude: value.latitude, longtitude: value.longitude);
                },
                myLocationEnabled: true,
                onCameraMove: ((value) {
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
              FloatingActionButton(
                onPressed: () {
                  _goToNewYork();
                },
                child: Text("sd"),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Text("demohkjajkdfhk")),
                      Container(
                        height: 1,
                        width: 350,
                        color: Colors.black,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text("ekjsjdfjk"),
                      ),
                    ],
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: ScrollController(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: Text("alksdjalksdjqw"),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 4,
                                blurRadius: 4)
                          ]),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: Text("alksdjalksdjqw"),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 4,
                                blurRadius: 4)
                          ]),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: Text("alksdjalksdjqw"),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 4,
                                blurRadius: 4)
                          ]),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: Text("alksdjalksdjqw"),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 4,
                                blurRadius: 4)
                          ]),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
