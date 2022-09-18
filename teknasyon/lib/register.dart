import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController userMail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController userSurname = TextEditingController();

  turnLogin() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic> route) => false);
  }

  Future<void> registerUser() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: userMail.text,
      password: userPassword.text,
    )
        .then((user) {
      FirebaseFirestore.instance.collection("Users").doc(userMail.text).set({
        "userMail": userMail.text,
        "userPassword": userPassword.text,
        "userName": userName.text,
        "userSurname": userSurname.text,
      });
    });
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white,
        title: Text("KAYDOL"),
        content: Text("Kayıt başarıyla gerçekleştirildi!"),
        actions: [
          MaterialButton(
              child: Text(
                "Tamam",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              ),
              shape: StadiumBorder(),
              minWidth: 150,
              height: 50,
              color: Color(0xff32CD32),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;
    var pageHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
                controller: userName,
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
                  hintText: "İsim",
                  hintStyle: TextStyle(color: Colors.black87),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: pageHeight / 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: pageWidth / 12),
              child: TextField(
                controller: userSurname,
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
                  hintText: "Soyisim",
                  hintStyle: TextStyle(color: Colors.black87),
                  prefixIcon: Icon(
                    Icons.person,
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
                controller: userMail,
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
                  hintText: "E-Posta",
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
              onPressed: registerUser,
              child: Text(
                "Kaydol",
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
                Text("Hesabın var mı?"),
                SizedBox(
                  width: pageWidth / 100,
                ),
                GestureDetector(
                  onTap: turnLogin,
                  child: Text(
                    "Giriş yap",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: pageHeight / 50,
            ),
            Center(
                child: Text(
              "Made by KONSEY ©",
              style: TextStyle(fontSize: 11),
            )),
          ],
        ),
      ),
    );
  }
}
