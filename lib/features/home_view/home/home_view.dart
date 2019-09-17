import 'package:flutter/material.dart';
import 'package:grab_demo/features/book_vehicle/book_vechicle.dart';
import 'package:grab_demo/ultis/IntentUltis.dart';
import 'package:toast/toast.dart';

class HomeScreen extends StatelessWidget {
  static final _listObtion = [
    {
      'content': 'Ô tô',
      'img': 'assets/images/hdpi/ic_parking_'
          'illustration.png',
      'key': 'car'
    },
    {
      'content': 'Xe máy',
      'img': 'assets/images/hdpi/ic_parking_'
          'illustration.png',
      'key': 'bike'
    },
    {
      'content': 'Đồ ăn',
      'img': 'assets/images/hdpi/ic_parking_'
          'illustration.png',
      'key': 'food'
    },
    {
      'content': 'Giao hàng',
      'img': 'assets/images/hdpi/ic_parking_'
          'illustration.png',
      'key': 'delivery'
    },
    {
      'content': 'Nạp tiền',
      'img': 'assets/images/hdpi/ic_parking_'
          'illustration.png',
      'key': 'mobile_card'
    },
    {
      'content': 'Hóa đơn',
      'img': 'assets/images/hdpi/ic_parking_'
          'illustration.png',
      'key': 'payment'
    },
    {
      'content': 'Gói Hội viên',
      'img': 'assets/images/hdpi/ic_parking_'
          'illustration.png',
      'key': 'memmber_package'
    },
    {
      'content': 'Xem Thêm',
      'img': 'assets/images/hdpi/ic_parking_'
          'illustration.png',
      'key': 'show_more'
    },
  ];
  ScrollController _scrollController;

  HomeScreen() {
    _scrollController = new ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            child: Stack(children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        "assets/images/evening.png",
                        height: 170,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 90),
                        alignment: Alignment(0, 0),
                        height: 200,
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                          itemBuilder: (ctx, index) {
                            print(_listObtion[index]['key']);
                            return ItemView(_listObtion[index], ctx);
                          },
                          itemCount: _listObtion.length,
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 120, left: 20, right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        spreadRadius: 4,
                      )
                    ]),
                alignment: Alignment(-1, 0),
                height: 130,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text("Kích hoạt ví điện tử Mocha"),
                            padding:
                                EdgeInsets.only(top: 10, bottom: 5, left: 20),
                            alignment: Alignment(-1, 0),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          FlatButton(
                            onPressed: () {
                              Toast.show("Thông báo", context);
                            },
                            child: Text(
                              "Kích Hoạt",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.teal[400],
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                    ),
                    ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      child: Image.asset(
                          "assets/images/hdpi/ic_food_batch_onboarding_3.webp"),
                    )
                  ],
                ),
              ),
              Container(
                height: 30,
                width: double.infinity,
                alignment: Alignment(0, 0),
                margin: EdgeInsets.only(top: 50),
                child: Text(
                  'Chúc bạn buổi tối vui vẻ',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ]),
          ),
          Container(
              height: 300,
              child: ListView.builder(
                  itemBuilder: (context, index) => ItemList(index),
                  itemCount: 6,
                  scrollDirection: Axis.horizontal)),
//
        ],
//
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  int _index;

  ItemList(this._index);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text("demo"),
          ),
        ],
      ),
    );
  }
}

class ItemView extends StatelessWidget {
  var _data;
  BuildContext _context;

  ItemView(this._data, this._context);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        onTap: () {
          onTap(_data['key']);
        },
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    _data['img'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                _data['content'],
                style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12),
              )
            ],
          ),
        ));
  }

  void onTap(data) {
    switch (data) {
      case "car":
        {
          IntenUtils.changeScreenNomal(this._context, BookVehicle());
          break;
        }
      case "bike":
        {
          break;
        }
      case "food":
        {
          break;
        }
      case "delivery":
        {
          break;
        }
      case "phone_card":
        {
          break;
        }
      case "bill":
        {
          break;
        }
      case "memmber_package":
        {
          break;
        }
      case "show_more":
        {
          break;
        }
    }
  }
}

class ItemListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(spreadRadius: 4, blurRadius: 4, color: Colors.black12)
          ]),
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            child: Image.asset("assets/images/hdpi/food.jpg"),
          )
        ],
      ),
    );
  }
}
