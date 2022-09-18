import 'dart:ffi';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teknasyon/add.dart';
import 'package:teknasyon/colors.dart';
import 'package:teknasyon/profile.dart';
import 'package:teknasyon/widgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  late List screens = [
    MainPage(),
    AddPage(press: _addFF),
    ProfilePage(),
  ];

  showActivePage() {
    setState(() {
      _currentIndex = 0;
    });
  }

  showProfilePage() {
    setState(() {
      _currentIndex = 2;
    });
  }

  double w = 100;
  double h = 50;
  bool isEye = false;
  bool kapat = false;
  bool isAdd = false;
  bool isReAdd = false;
  int sureSayaci = 0;

  showAddPage() {
    setState(() {
      _currentIndex = 1;
      kapat = true;
      isEye = true;
      isAdd = false;
    });
    return dynamic_island();
  }

  _addFF() {
    if (sureSayaci >= 1) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.white,
          title: Text("Zaman Aşımı"),
          content: Text("Listeye sadece 10 dakikada bir şarkı ekleyebilirsin."),
          actions: [
            MaterialButton(
                child: Text(
                  "Tamam",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minWidth: 150,
                height: 50,
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        ),
      );
    } else {
      setState(() {
        w = 300;
        h = 50;
        isAdd = true;
        kapat = true;
        sureSayaci++;
      });

      musicName.add(populerMusicName[3]);
      musicImg.add("images/are_you_happy.jfif");
    }
  }

  dynamic_island() {
    if (w == 100) {
      setState(() {
        w = 300;
        h = 50;
        isEye = true;
        kapat = true;
      });
    } else if (w == 300) {
      setState(() {
        w = 100;
        h = 50;
        isEye = false;
        kapat = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;
    var pageHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black87,
      extendBody: true,
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: dynamic_island,
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: w,
                  height: h,
                  curve: Curves.easeInOutBack,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black,
                  ),
                  child: isEye
                      ? Row(
                          children: [
                            Expanded(
                                child: IconButton(
                                    onPressed: showActivePage,
                                    icon: Icon(
                                      Icons.library_books,
                                      color: Colors.white,
                                    ))),
                            SizedBox(
                              width: pageWidth / 20,
                            ),
                            Expanded(
                                child: IconButton(
                                    onPressed: showAddPage,
                                    icon: Icon(
                                      (Icons.add_circle),
                                      color: Colors.white,
                                    ))),
                            SizedBox(
                              width: pageWidth / 20,
                            ),
                            Expanded(
                                child: IconButton(
                              onPressed: showProfilePage,
                              icon: Icon(Icons.person_outlined),
                              color: Colors.white,
                            )),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            isAdd
                                ? Expanded(
                                    child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: pageWidth / 5),
                                    child: Text(
                                      "Müzik sıraya eklendi!",
                                      style: GoogleFonts.archivo(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ))
                                : Icon(
                                    Icons.menu_rounded,
                                    color: Colors.white,
                                  ),
                          ],
                        )),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 50,
        title: Text(
          "MUSICAFE",
          style: GoogleFonts.archivoBlack(fontSize: 32, letterSpacing: 4),
        ),
        centerTitle: true,
      ),
      body: screens[_currentIndex],
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget lvl1_yuzuk_sheet() => Container(
      decoration: BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        children: [
          Text(
            "NENYA",
            style: GoogleFonts.bakbakOne(fontSize: 41, color: Colors.white),
          ),
          Image.asset(
            "images/yuzuk1.png",
            scale: 2,
          ),
          Text(
            "2. Seviye Müdavim burada!",
            style: GoogleFonts.archivo(
                color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
          )
        ],
      ));
  Widget lvl2_yuzuk_sheet() => Container(
      decoration: BoxDecoration(
          color: red,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        children: [
          Text(
            "NARYA",
            style: GoogleFonts.bakbakOne(fontSize: 41, color: Colors.white),
          ),
          Image.asset(
            "images/yuzuk2.png",
            scale: 6,
          ),
          Text(
            "1. Seviye Müdavim burada!",
            style: GoogleFonts.archivo(
                color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
          )
        ],
      ));

  lvl1_yuzuk() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => lvl1_yuzuk_sheet());
  }

  lvl2_yuzuk() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => lvl2_yuzuk_sheet());
  }

  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;
    var pageHeight = MediaQuery.of(context).size.height;

    return Container(
      width: pageWidth,
      height: pageHeight,
      color: Colors.white,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: pageHeight / 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: pageWidth / 18,
                ),
                Text(
                  "Şu anda çalıyor",
                  style: GoogleFonts.poppins(
                      fontSize: 21, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: pageWidth / 30,
                ),
                SizedBox(
                  height: pageHeight / 15,
                ),
                SpinKitWave(
                  color: Colors.black,
                  size: 20,
                  duration: Duration(milliseconds: 2400),
                ),
                SizedBox(
                  width: pageWidth / 10,
                ),
                Container(
                  width: pageWidth / 3.7,
                  height: pageHeight / 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black87,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: lvl1_yuzuk,
                          child: Image(
                            image: AssetImage("images/yuzuk1.png"),
                            width: 36,
                            height: 36,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: pageWidth / 60,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: lvl2_yuzuk,
                          child: Image(
                            image: AssetImage("images/yuzuk2.png"),
                            width: 36,
                            height: 36,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: 500,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  itemCount: musicName.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          width: pageWidth / 1.1,
                          height: pageHeight / 10,
                          margin: EdgeInsets.all(pageHeight / 200),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: pageWidth / 50,
                              ),
                              Card(
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Stack(
                                  children: [
                                    Image(
                                      fit: BoxFit.cover,
                                      width: 48,
                                      height: 48,
                                      image: AssetImage(musicImg[index]),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: pageWidth / 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: pageHeight / 40,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        musicName[index],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: pageWidth / 3,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: pageHeight / 150,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        musicDuration[index],
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        width: pageWidth / 2,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
