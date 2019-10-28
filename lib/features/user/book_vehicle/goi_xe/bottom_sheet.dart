import 'package:flutter/material.dart';
import 'package:grab_demo/ultis/IntentUltis.dart';
import 'package:grab_demo/ultis/common.dart';

import '../bloc_book_vehicle.dart';
import '../book_vehicle_presenter.dart';

class ModalBottomSheet extends StatefulWidget {
  TextEditingController _textControll;
  ScrollController _scrollController;
  BlocBookVechicle _bloc;

  var gimPosotion;
  BookVehiclePresenter presenter;

  ModalBottomSheet(this.presenter, this._bloc, this.gimPosotion);

  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  String _diaChiDen;
  ScrollController _listContrller;

  _ModalBottomSheetState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 5, top: 35),
            width: 30,
            height: 30,
            child: FloatingActionButton(
              onPressed: () {
                IntentUtils.backView(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
                size: 15,
              ),
              backgroundColor: Colors.white,
            ),
          ),
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
                          widget.gimPosotion["road"],
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
                        autofocus: true,
                        onEditingComplete: () {
                          print("00000000000" + _diaChiDen);
                        },
                        onChanged: (value) {
                          _diaChiDen = value;
//                          widget.presenter.searchByName(_diaChiDen);
//                          widget._textControll.text = value;
                        },
                        onSubmitted: (value) {
                          widget.presenter.searchByName(_diaChiDen);
                        },
                        controller: widget._textControll,
                        maxLines: 1,
                        maxLength: 30,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                            hintText: "Tôi "
                                "muốn đến...",
                            border: InputBorder.none,
                            counter: Offstage()),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: StreamBuilder(
              stream: widget._bloc.getStream(),
              builder: (cxt, snapshoot) {
                if (snapshoot.hasData) print(snapshoot.data);
                return Stack(
                  children: <Widget>[
                    Visibility(
                      visible: snapshoot.hasData &&
                          snapshoot.data["check"] == Common.LIST_PLEACE,
                      child: ListView.separated(
                        separatorBuilder: (ctx, index) => Container(
                          color: Colors.grey,
                          height: 1,
                        ),
                        itemBuilder: (ctx, index) {
                          String name = "", diaChi = "", placeId = "";
                          if (snapshoot.hasData &&
                              snapshoot.data["check"] == Common.LIST_PLEACE) {
                            name = snapshoot.data["value"][index]
                                ["structured_formatting"]["main_text"];
                            diaChi = snapshoot.data["value"][index]
                                ["structured_formatting"]["secondary_text"];
                            placeId =
                                snapshoot.data["value"][index]["place_id"];
                          }
                          return GestureDetector(
                            onTap: () {
                              widget.presenter.postSelectdPlace({
                                "current": {
                                  "lat": widget.gimPosotion["lat"],
                                  "lng": widget.gimPosotion["lng"]
                                },
                                "willGo": "",
                                "pleaceId": placeId,
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.only(
                                    left: 10, top: 10, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      name,
                                      style: TextStyle(
                                          fontFamily: "FontGrabMedium",
                                          fontSize: 15),
                                    ),
                                    Text(
                                      diaChi,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    )
                                  ],
                                )),
                          );
                        },
                        itemCount: snapshoot.hasData &&
                                snapshoot.data["check"] == Common.LIST_PLEACE
                            ? snapshoot.data["value"].length
                            : 10,
                        controller: _listContrller,
                        physics: ScrollPhysics(),
                      ),
                    ),
                    Visibility(
                      visible: !snapshoot.hasData ||
                          snapshoot.data["check"] != Common.LIST_PLEACE,
                      child: SingleChildScrollView(
                        child: Container(
                          height: 60,
                          color: Color.fromRGBO(0, 0, 0, 0.03),
                          width: double.infinity,
//                          post will go include home, company, ... and pleace
//                will go selected by list
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.only(
                                    top: 5, bottom: 5, left: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black45,
                                        blurRadius: 1,
                                      )
                                    ]),
                              ),
                              GestureDetector(
                                onTap: () {
                                  widget.presenter.postSelectdPlace({
                                    "current": {
                                      "lat": widget.gimPosotion["lat"],
                                      "lng": widget.gimPosotion["lng"]
                                    },
                                    "willGo": {
                                      "lat": 21.000397,
                                      "lng": 105.796044
                                    },
                                    "pleaceId": "",
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.only(
                                      top: 5, bottom: 5, left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black45,
                                          blurRadius: 1,
                                        )
                                      ]),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    _listContrller = new ScrollController();
    widget._textControll = new TextEditingController();
    super.initState();
  }
}
