import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teknasyon/widgets.dart';

import 'login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  signOut() {
    FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic> route) => false);
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;
    var pageHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        width: pageWidth,
        height: pageHeight,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: pageHeight / 50,
            ),
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(
                "images/gandalf.png",
              ),
            ),
            Divider(
              endIndent: pageWidth / 10,
              indent: pageWidth / 10,
              thickness: 2,
              color: Colors.black26,
            ),
            showUserNameSurname(),
            SizedBox(
              height: pageHeight / 100,
            ),
            Text(
              auth.currentUser!.email.toString(),
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: pageHeight / 30,
            ),
            Text(
              "Müdavim Mekanlar",
              style: GoogleFonts.archivo(fontSize: 22),
            ),
            Divider(
              thickness: 1,
              color: Colors.black54,
              indent: pageWidth / 5,
              endIndent: pageWidth / 5,
            ),
            Stack(
              children: [
                Image.asset(
                  "images/dukkan.png",
                  scale: 5,
                ),
              ],
            ),
            Text(
              "Teknasyon Cafe",
              style: GoogleFonts.archivo(
                  fontSize: 21, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: pageHeight / 100,
            ),
            Image.asset(
              "images/yuzuk2.png",
              scale: 40,
            ),
            SizedBox(
              height: pageHeight / 50,
            ),
            FlatButton(
              minWidth: 100,
              height: 40,
              color: Colors.red,
              onPressed: signOut,
              child: Text(
                "Çıkış yap",
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
