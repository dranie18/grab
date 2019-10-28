import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grab_demo/ultis/common.dart';
import 'package:http/http.dart' as api;

import 'bloc_goi_xe_map.dart';
import 'map_goi_xe_contract.dart';

class MapGoiXePresenter {
  MapGoiXeContract _contract;
  BuildContext _context;
  BlocGoiXeMap _bloc;
  MapGoiXePresenter(this._contract, this._context, this._bloc);

  void getRoute(LatLng curentPosotion, LatLng positionWillGo) {
    print("${positionWillGo.latitude},${positionWillGo.longitude}");
    List<LatLng> _polylines = new List();
    String _url = "https://maps.googleapis"
        ".com/maps/api/directions/json?origin=${curentPosotion.latitude},"
        "${curentPosotion.longitude}&destination=${positionWillGo.latitude},"
        "${positionWillGo.longitude}&key=${Common.API_KEY}";
    api.get(_url).then((value) {
      var demo = jsonDecode(value.body);
//something will wrong
      _contract.updateData(demo["routes"][0]["legs"][0]["steps"]);

      for (var a in demo["routes"][0]["legs"][0]["steps"]) {
        _polylines.add(
            LatLng(a["start_location"]["lat"], a["start_location"]["lng"]));
        _polylines
            .add(LatLng(a["end_location"]["lat"], a["end_location"]["lng"]));
      }
      _bloc.upDatepolylines(_polylines);
    });
  }

  void postBookCar(value) {
    print(value);
  }
}
