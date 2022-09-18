import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'login.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;
    var pageHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(bottom: pageHeight / 25),
        decoration: BoxDecoration(
            image: DecorationImage(
                scale: 4, image: AssetImage("images/cafe_logo.png"))),
        child: Column(
          children: [
            SizedBox(
              height: pageHeight / 1.5,
            ),
            SpinKitChasingDots(
              color: Colors.brown,
              size: 50,
              duration: Duration(milliseconds: 2400),
            ),
            SizedBox(
              height: pageHeight / 10,
            ),
            Image.asset(
              "images/konseypng.png",
              scale: 15,
            ),
          ],
        ),
      ),
    );
  }
}
