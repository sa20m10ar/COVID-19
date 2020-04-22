import 'package:flutter/material.dart';
import 'data_source.dart';

import 'pages/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COVID19',
      theme: ThemeData(
        fontFamily: "Circular",
        primaryColor: primaryBlack,
      ),
      home: SplashScreen(),
    );
  }
}

