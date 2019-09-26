import 'package:grab_demo/ultis/common.dart';
import 'package:http/http.dart';

import 'book_vechicle_contract.dart';

class BookVehiclePresenter {
  BookVehicleContract _contract;

  BookVehiclePresenter(this._contract);

  void getName(value) async {
    String demo =
        "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?"
        "input=road&inputtype=textquery"
        "&fields=photos,formatted_address,name,opening_hours,rating"
        "&locationbias=circle:20@${value['la']},${value['long']}"
        "&key=${Common.API_KEY}";
    Response response = await get(demo);
    print(response.body);
  }
}
