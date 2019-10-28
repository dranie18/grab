import 'package:flutter/material.dart';
import 'package:grab_demo/features/user/book_vehicle/thue_xe/search_bottom_sheet.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart';

import '../bloc_book_vehicle.dart';
import '../book_vehicle_presenter.dart';
import 'bottom_sheet.dart';

class ThueXe extends StatelessWidget {
  BookVehiclePresenter _presenter;
  BlocBookVechicle _bloc;

  ThueXe(this._presenter, this._bloc);

  String currentRoad = "Hãy chọn điểm đến của bạn";

  @override
  Widget build(BuildContext context) {
//    _presenter.postCurrentPosition({"thue_se",})
    return Container(
        color: Colors.grey[100],
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/hdpi/ic_dynamic_shuttle_on_board.webp",
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text("Đặt xe theo giờ"),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                              "Hãy đặt xe và tài sế đoan trong khoảng thời "
                              "gian của bạn asdk;laklkadfjalkjdlksdfa;"
                              "Hãy đặt xe và tài sế đoan trong khoảng thời "
                              "gian của bạn asdk;laklkadfjalkjdlksdfa;"
                              "Hãy đặt xe và tài sế đoan trong khoảng thời "
                              "gian của bạn asdk;laklkadfjalkjdlksdfa;"
                              "Hãy đặt xe và tài sế đoan trong khoảng thời "
                              "gian của bạn asdk;laklkadfjalkjdlksdfa;"
                              "Hãy đặt xe và tài sế đoan trong khoảng thời "
                              "gian của bạn asdk;laklkadfjalkjdlksdfa;"
                              "lsdkfjasdlfkjasdfasdfasdf;"),
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Tìm hiểu thêm",
                            style: TextStyle(
                                color: Colors.teal[300],
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
            Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, spreadRadius: 2, blurRadius: 8)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment(-1, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/hdpi/ic_onjobnav_pic"
                          "kup_pin_small.png",
                          width: 20,
                          height: 20,
                          fit: BoxFit.cover,
                        ),
                        GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => SearchBottomSheet(
                                    _presenter, _bloc, {
                                  "lat": null,
                                  "lng": null,
                                  "road": "curentRoad"
                                }),
                              );
                            },
                            child: StreamBuilder(
                              stream: _bloc.getStream(),
                              builder: (ctx, snshoot) => Container(
                                padding: EdgeInsets.only(left: 10),
                                child: snshoot.hasData &&
                                        snshoot.data["check"] == "demo"
                                    ? Text(currentRoad)
                                    : Text(currentRoad),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(color: Colors.grey, width: 0.5)),
                  ),
                  GestureDetector(
                    onTap: () {
                      showSlideDialog(
                          context: context,
                          child: BottomSheetView(),
                          barrierColor: Colors.black12,
                          barrierDismissible: true,
                          transitionDuration: Duration(milliseconds: 300));
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      color: Colors.transparent,
                      alignment: Alignment(-1, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            size: 20,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Trong bao lâu ?"),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
