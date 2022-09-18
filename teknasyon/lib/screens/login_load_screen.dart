import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:teknasyon/home.dart';

class LoginLoadScreen extends StatefulWidget {
  const LoginLoadScreen({Key? key}) : super(key: key);

  @override
  State<LoginLoadScreen> createState() => _LoginLoadScreenState();
}

class _LoginLoadScreenState extends State<LoginLoadScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
          (Route<dynamic> route) => false);
    });
  }

  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;
    var pageHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
