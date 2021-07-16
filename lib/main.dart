import 'package:flutter/material.dart';
import 'package:mini_snap/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AR Face Filter App',
      debugShowCheckedModeBanner: false,
      home: MySplashScreen(),
    );
  }
}
