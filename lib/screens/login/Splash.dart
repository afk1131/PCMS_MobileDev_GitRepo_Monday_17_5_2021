import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcms/screens/login/loginPage.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    splashTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          height: MediaQuery.of(context).size.height / 5,
          width: MediaQuery.of(context).size.height / 5,
        ),
      ),
    );
  }

  void splashTimer() {
    Future.delayed(Duration(seconds: 5), () {
      // 5s over, navigate to a new page
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }
}
