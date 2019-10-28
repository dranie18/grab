import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grab_demo/features/user/map_dat_xe/map_goi_xe.dart';
import 'package:grab_demo/ultis/IntentUltis.dart';
import 'package:grab_demo/ultis/common.dart';
import 'package:http/http.dart' as api;
import 'package:http/http.dart';

import 'bloc_book_vehicle.dart';
import 'book_vechicle_contract.dart';

class BookVehiclePresenter {
  BookVehicleContract _contract;
  BookVehiclePresenter(this._contract, this._bloc, this._context);
  BlocBookVechicle _bloc;
  BuildContext _context;
  void getName(value) async {
    String demo = "https://maps.googleapis"
        ".com/maps/api/geocode/json?latlng=${value["lat"]},"
        "${value["lng"]}&sensor=true&key=${Common.API_KEY}";
    print("${value['lat']},${value['long']}");
    var response = await api.get(demo);
    print(jsonDecode(response.body)["results"][0]["formatted_address"]);
    _contract.upDateRoad(
        jsonDecode(response.body)["results"][0]["formatted_address"]);
  }

  void searchByName(value) async {
    print("000000000000" + value);
    String uri = "https://maps.googleapis"
        ".com/maps/api/place/autocomplete/json?input=${value}&key=${Common.API_KEY}";
//        "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?"
//        "input=${value}&inputtype=textquery&fields=photos,formatted_address,name,"
//        "geometry&locationbias=circle:5000&key=${Common.API_KEY}";
    var response = await api.get(uri);
    print(jsonDecode(response.body)['predictions']);
    _bloc.upDateData({
      "check": Common.LIST_PLEACE,
      "value": jsonDecode(response.body)['predictions']
    });
  }

  void postCurrentPosition(value) {
//    postCurrentPosotion;
//    String uri = ""
//  done
//  bloc update Driver Around
  }

  void postSelectdPlace(value) async {
    LatLng willGo;
    if (value["placeId"] != "") {
      Response response = await api.get("https://maps.googleapis"
          ".com/maps/api/place/details/json?place_id"
          "=${value["pleaceId"]}&fields=geometry&key=${Common.API_KEY}");
      var data = jsonDecode(response.body)["result"];
      print(data);
      willGo = LatLng(data["geometry"]["location"]["lat"],
          data["geometry"]["location"]["lng"]);
    } else
      willGo = LatLng(value["willGo"]["lat"], value["willGo"]["lng"]);
    IntentUtils.changeScreenNomal(
      _context,
      MapGoiXe(
          LatLng(value["current"]["lat"], value["current"]["lng"]), willGo, [
        {"item": 1},
        {"item": 2},
        {"item": 3},
        {"item": 4},
        {"item": 5},
        {"item": 6},
        {"item": 7}
      ]),
    );
  }
}
