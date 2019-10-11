import 'package:flutter/material.dart';

import 'features/book_vehicle/book_vechicle.dart';
import 'features/login/Login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      title: 'Flutter Demo',
      routes: {
        "/": (context) => LoginView(),
        "/bookvechicle": (context) => BookVehicle(),
      },
      theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.green,
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.transparent,
          )),
    );
  }
}
