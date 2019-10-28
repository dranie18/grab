import 'package:flutter/material.dart';
import 'package:grab_demo/features/user/book_vehicle/book_vechicle.dart';
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
      'content': 'Gói hội viên',
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

  HomeScreen() {}

  @override
  Widget build(BuildContext context) {
    _scrollController = new ScrollController()
      ..addListener(() {
        if (_scrollController.position.minScrollExtent ==
            _scrollController.offset) Toast.show("ok load more", context);
      });
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
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
                                padding: EdgeInsets.only(
                                    top: 10, bottom: 5, left: 20),
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
              ItemList(1),
              ItemList(1),
              ItemList(1),
              ItemList(1),
              ItemList(1),
              ItemList(1), ItemList(1),
              ItemList(1),
              ItemList(1),
              ItemList(1),
              ItemList(1),
              ItemList(1), ItemList(1),
              ItemList(1),
              ItemList(1),
              ItemList(1),
              ItemList(1),
              ItemList(1), ItemList(1),
              ItemList(1),
              ItemList(1),
              ItemList(1),
              ItemList(1),
              ItemList(1),
//              Container(
//                  child: ListView.builder(
//                      physics: NeverScrollableScrollPhysics(),
//                      itemBuilder: (context, index) => ItemList(index),
//                      itemCount: 6,
//                      scrollDirection: Axis.vertical)),
            ],
          )),
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
            height: 50,
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Hướng dẫn sử dụng ví điện tử Grab",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 17),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                  ),
                )
              ],
            ),
          ),
          Container(
              height: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) => ChildItemListView(0),
                itemCount: 20,
                scrollDirection: Axis.horizontal,
              ))
        ],
      ),
    );
  }
}

class ChildItemListView extends StatelessWidget {
  int _index;

  ChildItemListView(this._index);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 5, spreadRadius: 3, color: Colors.black12)
            ]),
        width: 280,
        margin: EdgeInsets.all(10),
        child: GestureDetector(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                Container(
                  height: 120,
                  child: FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      placeholder: "assets/images/banner.png",
                      image:
                          "https://assets.grab.com/wp-content/uploads/sites/11/2018/10/09181319/Header-image-FM-LM.jpg"),
                ),
                Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("title",
                            style: TextStyle(
                                fontWeight: FontWeight.w100,
                                fontFamily: "FontGrab")),
                        Text(
                            "contentádhkajshdkasdhkajsdkakajdhkajshdakdkajhsdkjah"
                            "sdhahsdjkáklaasklasjdklasdjlaksdjlaksdjalksdjasd"
                            "jkalskdjlaksd=asdasdaklsdjlkajsdlkajsdlkajsldjal"
                            "skdahsdkjahsdk",
                            style: TextStyle(fontWeight: FontWeight.w100)),
                      ],
                    )),
                Container(
                  height: 1,
                  color: Colors.black12,
                  margin: EdgeInsets.only(left: 10, right: 10),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.thumb_up,
                          size: 18,
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                      Text(
                        "20",
                        style: TextStyle(fontWeight: FontWeight.w100),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
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
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black),
              )
            ],
          ),
        ));
  }

  void onTap(data) {
    switch (data) {
      case "car":
        {
          IntentUtils.changeScreenNomal(this._context, BookVehicle());
          break;
        }
      case "bike":
        {
          IntentUtils.changeScreenNomal(this._context, BookVehicle());
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
