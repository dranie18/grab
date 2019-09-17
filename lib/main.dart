import 'package:flutter/material.dart';

import 'features/home_view/home/home_view.dart';
import 'features/home_view/main_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      title: 'Flutter Demo',
      routes: {
        "/": (context) => MainView(),
      },
      theme: ThemeData(
          primaryColor: Colors.lightGreen,
          accentColor: Colors.green,
          fontFamily: "Fontfamily"),
    );
  }
}
