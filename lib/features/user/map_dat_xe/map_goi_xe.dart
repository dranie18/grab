import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grab_demo/ultis/IntentUltis.dart';

import 'bloc_goi_xe_map.dart';
import 'map_goi_xe_contract.dart';
import 'map_goi_xe_presenter.dart';

class MapGoiXe extends StatefulWidget {
  LatLng _currentPosotion, _posotionWillGo;
  List list;
  MapGoiXe(this._currentPosotion, this._posotionWillGo, this.list);

  @override
  _MapGoiXeState createState() {
    list = list.map((element) {
      if (list.indexOf(element) == 0) return {...element, "isSelected": true};
      return {...element, "isSelected": false};
    }).toList();
    print(list);
    return _MapGoiXeState();
  }
}

class _MapGoiXeState extends State<MapGoiXe> implements MapGoiXeContract {
  Completer<GoogleMapController> _controller = Completer();

  Set<Polyline> _polylines;

  MapGoiXePresenter _presenter;

  BlocGoiXeMap _bloc = new BlocGoiXeMap();

  ScrollController _listController;

  @override
  Widget build(BuildContext context) {
    _presenter = new MapGoiXePresenter(this, context, _bloc);
    _presenter.getRoute(widget._currentPosotion, widget._posotionWillGo);
    // TODO: implement build
    _polylines = new Set();
    _polylines.add(Polyline(
        polylineId: PolylineId("demo"), points: [widget._currentPosotion]));
    _polylines.add(Polyline(
        polylineId: PolylineId("demo"), points: [widget._posotionWillGo]));
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Stack(
            children: <Widget>[
              StreamBuilder(
                stream: _bloc.getStream(),
                builder: (ctx, snapShoot) => GoogleMap(
                    zoomGesturesEnabled: true,
                    onMapCreated: onMapCreateed,
                    initialCameraPosition: CameraPosition(
                        target: widget._currentPosotion, zoom: 15),
                    myLocationEnabled: true,
                    markers: markers(),
                    myLocationButtonEnabled: true,
                    padding: EdgeInsets.only(top: 20),
                    mapType: MapType.normal,
                    polylines: getPolylines(snapShoot)),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 10),
                height: 40,
                width: 40,
                child: FittedBox(
                  child: FloatingActionButton(
                    child: Icon(
                      Icons.arrow_back,
                      size: 25,
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.white,
                    onPressed: () {
                      IntentUtils.backView(context);
                    },
                    elevation: 2,
                  ),
                ),
              )
            ],
          ),
          Container(
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Gợi ý dịch vụ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: "FontGrabMedium"),
                      )),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (ctx, index) => ItemView(ctx, index),
                      itemCount: widget.list.length,
                      controller: _listController,
                    ),
                  ),
                  Container(
                    child: FlatButton(
                      onPressed: () {
                        _presenter.postBookCar(widget.list.singleWhere(
                            (element) => element["isSelected"],
                            orElse: () => null));
                      },
                      child: Container(
                        alignment: Alignment(0, 0),
                        width: double.infinity,
                        height: 45,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.green[600],
                            borderRadius: BorderRadius.all(Radius.circular(7))),
                        child: Text(
                          "Đặt xe GrabCard",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  markers() {
    Set<Marker> mk = new Set();
    mk.add(Marker(
        markerId: MarkerId("current"),
        position: widget._currentPosotion,
        infoWindow: InfoWindow(snippet: "snippet", title: "title"),
        icon: BitmapDescriptor.fromAsset("assets/images/"
            "hdpi/ic_onjobnav_pickup_pin_small.png")));
    mk.add(Marker(
        markerId: MarkerId("willgo"),
        position: widget._posotionWillGo,
        infoWindow: InfoWindow(snippet: "snippet", title: "title"),
        icon: BitmapDescriptor.fromAsset("assets/images/"
            "hdpi/ic_onjobnav_pickup_pin_small.png")));
    return mk;
  }

  onMapCreateed(GoogleMapController controller) {
    if (!_controller.isCompleted) {
      _controller.complete(controller);
    }
  }

  @override
  void showError(mes) {
    // TODO: implement showError
  }

  @override
  void updateData(data) {}

  getPolylines(snapShoot) {
    if (snapShoot.hasData)
      _polylines.add(
        Polyline(
            polylineId: PolylineId("demo"),
            points: snapShoot.data,
            color: Colors.green,
            width: 8),
      );
    return _polylines;
  }

  StatelessWidget ItemView(context, index) {
    return GestureDetector(
      onTap: () {
        widget.list.every((element) {
          if (element["isSelected"]) element["isSelected"] = false;
          return true;
        });
        setState(() {
          widget.list[index]["isSelected"] = true;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: widget.list[index]["isSelected"]
            ? BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.green, width: 1))
            : BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey[50]),
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 15),
              child: Image.asset(
                "assets/images/grab_car.png",
                height: 40,
                width: 40,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "GrabCar",
                      style: TextStyle(
                          fontFamily: "FontGrabMedium",
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    child: Text("4 chỗ"),
                  )
                ],
              ),
            ),
            Container(
              child: Text(
                "VND 14K",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: "FontGrabMedium",
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
