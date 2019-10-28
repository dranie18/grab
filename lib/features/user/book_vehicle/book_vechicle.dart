import 'package:flutter/material.dart';
import 'package:grab_demo/features/user/book_vehicle/thue_xe/thue_xe.dart';
import 'package:grab_demo/ultis/common.dart';
import 'package:toast/toast.dart';

import 'bloc_book_vehicle.dart';
import 'book_vechicle_contract.dart';
import 'book_vehicle_presenter.dart';
import 'goi_xe/goi_xe.dart';

BookVehiclePresenter _presenter;
BlocBookVechicle bloc;

class BookVehicle extends StatefulWidget {
  PageController _pageController;
  TabController _tabController;

  BookVehicle() {
    bloc = BlocBookVechicle();
    _pageController = new PageController(keepPage: true, initialPage: 0);
    _tabController = TabController(length: 2, vsync: AnimatedListState());
  }

  @override
  _BookVehicleState createState() => _BookVehicleState();
}

class _BookVehicleState extends State<BookVehicle>
    implements BookVehicleContract {
  _BookVehicleState() {}

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _presenter = new BookVehiclePresenter(this, bloc, context);
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.green,
            labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            unselectedLabelColor: Colors.black,
            unselectedLabelStyle:
                TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            onTap: (index) {
              widget._pageController.jumpToPage(index);
            },
            controller: TabController(length: 2, vsync: AnimatedListState()),
            tabs: <Widget>[
              Tab(
//                text: "Gọi Xe",
                child: Text(
                  "Gọi Xe",
                ),
              ),
              Tab(
                text: "Thuê Xe",
              ),
            ],
          ),
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: widget._pageController,
          children: <Widget>[GoiXe(bloc, _presenter), ThueXe(_presenter, bloc)],
        ));
  }

  @override
  void showError(mes) {
    Toast.show("ERROR " + mes.toString(), context);
  }

  @override
  void updateData(data) {
    switch (data['key']) {
      case "goixe":
        {
          break;
        }
      case "thuexe":
        {
          break;
        }
    }
  }

  @override
  void upDateRoad(value) {
    bloc.upDateData({"check": Common.CURENT_ROAD, "value": value});
  }
}
