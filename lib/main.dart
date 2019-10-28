import 'package:flutter/material.dart';

import 'features/login/Login.dart';
import 'features/user/book_vehicle/book_vechicle.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      title: 'Flutter Demo',
      routes: {
        "/": (context) => LoginView(),
        "/bookvechicle": (context) => BookVehicle(),
      },
      theme: ThemeData(
          primaryColor: Colors.white,
          fontFamily: "FontGrab",
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.transparent,
          )),
    );
  }
}
