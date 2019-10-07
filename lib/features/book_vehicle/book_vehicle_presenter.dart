import 'package:grab_demo/ultis/common.dart';

import 'book_vechicle_contract.dart';

class BookVehiclePresenter {
  BookVehicleContract _contract;
  BookVehiclePresenter(this._contract);

  void getName(value) async {
    String demo = "https://maps.googleapis"
        ".com/maps/api/geocode/json?latlng=${value["lat"]},"
        "${value["long"]}&sensor=true&key=${Common.API_KEY}";
    print("${value['lat']},${value['long']}");
//    var response = await api.get(demo);
//    print(response.body);
//    _contract.upDateRoad(
//        jsonDecode(response.body)["results"][0]["formatted_address"]);
  }

  void searchByName(value) async {
    String uri =
        "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?"
        "input=${value}&inputtype=textquery&fields=photos,formatted_address,name,"
        "geometry&key=${Common.API_KEY}";
//    var response = await api.get(uri);
//    if (response.statusCode == 200) print(response.body);
  }
}
