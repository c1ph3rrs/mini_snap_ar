import 'package:flutter/material.dart';
import 'package:mini_snap/cameraWithMaskFilterScreen.dart';
import 'package:splashscreen/splashscreen.dart';


class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 10,
      navigateAfterSeconds: CameraWithMaskFilterScreen(),
      title: Text(
        'AR Splash Screen',
        style: TextStyle(
          fontSize: 55,
          color: Colors.deepPurpleAccent,
          fontFamily: "Signatra"
        ),
      ),
      image: Image.asset(
          'assets/images/icon.png',
      ),
      backgroundColor: Colors.white,
      photoSize: 140,
      loaderColor: Colors.deepPurple,
      loadingText: Text(
        'Ibrahim Akram',
        style: TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 16,
          fontFamily: 'Brand Bold'
        ),
      ),
    );
  }
}
