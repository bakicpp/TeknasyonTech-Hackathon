import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teknasyon/register.dart';
import 'package:teknasyon/screens/login_load_screen.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController t1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;
    var pageHeight = MediaQuery.of(context).size.height;

    TextEditingController userEmail = TextEditingController();
    TextEditingController userPassword = TextEditingController();

    Future login() async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userEmail.text, password: userPassword.text);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginLoadScreen()),
          (Route<dynamic> route) => false);
    }

    register() {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => RegisterPage()),
          (Route<dynamic> route) => true);
    }

    return Scaffold(
      body: Container(
        width: pageWidth,
        height: pageHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: pageHeight / 8,
              ),
              buildLogo(),
              Text(
                "MUSICAFE",
                style:
                    GoogleFonts.archivoBlack(fontSize: 21, color: Colors.black),
              ),
              SizedBox(
                height: pageHeight / 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: pageWidth / 12),
                child: TextField(
                  controller: userEmail,
                  style: TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: const BorderSide(color: Colors.blueAccent),
                    ),
                    hintText: "E-posta",
                    hintStyle: TextStyle(color: Colors.black87),
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: pageHeight / 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: pageWidth / 12,
                ),
                child: TextField(
                  obscureText: true,
                  controller: userPassword,
                  style: TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: const BorderSide(color: Colors.blueAccent),
                    ),
                    hintText: "Şifre",
                    hintStyle: TextStyle(color: Colors.black87),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: pageHeight / 40,
              ),
              FlatButton(
                minWidth: pageWidth / 1.2,
                height: pageHeight / 14,
                onPressed: login,
                child: Text(
                  "Giriş yap",
                  style: GoogleFonts.archivo(fontSize: 18, color: Colors.white),
                ),
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: pageHeight / 100,
              ),
              Text("ya da"),
              SizedBox(
                height: pageHeight / 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Hesabın yok mu?"),
                  SizedBox(
                    width: pageWidth / 100,
                  ),
                  GestureDetector(
                    onTap: register,
                    child: Text(
                      "Kaydol",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: pageHeight / 10,
              ),
              Center(
                  child: Text(
                "Made by KONSEY ©",
                style: TextStyle(fontSize: 11),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class buildLogo extends StatelessWidget {
  const buildLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Image(
          width: 180,
          height: 180,
          image: AssetImage("images/cafe_logo.png"),
        ),
      ),
    );
  }
}
