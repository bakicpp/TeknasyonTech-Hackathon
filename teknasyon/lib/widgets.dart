import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List populerMusicName = [
  "Are you happy?",
  "Kibir",
  "SAD",
  "Aldırma Gönül",
  "Fever",
  "TO THE MOON",
];

List musicDuration = ["2:37", "4:04", "3:58", "3:28"];

List musicName = [
  "Are you happy?",
  "Another Love",
  "Heat Waves",
];

List artistName = [
  "SHY Martin",
  "Contra",
  "XXXTENTACION",
  "Hayko Cepkin",
  "Dua Lipa",
  "Jnr Choi"
];

List musicImg = [
  "images/are_you_happy.jfif",
  "images/another_love.jfif",
  "images/heat_waves.jfif",
  "images/are_you_happy.jfif",
  "images/another_love.jfif",
  "images/heat_waves.jfif"
];

class MusicCard extends StatefulWidget {
  final VoidCallback? onPressed;
  final int index;
  final int imageindex;
  final double textpadding;
  final double namepadding;
  MusicCard(
      {Key? key,
      required this.onPressed,
      required this.textpadding,
      required this.namepadding,
      required this.index,
      required this.imageindex})
      : super(key: key);

  @override
  State<MusicCard> createState() => _MusicCardState();
}

class _MusicCardState extends State<MusicCard> {
  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;
    var pageHeight = MediaQuery.of(context).size.height;
    return Container(
      width: pageWidth / 1.1,
      height: pageHeight / 10,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Image(
                    fit: BoxFit.cover,
                    width: 48,
                    height: 48,
                    image: AssetImage(musicImg[widget.imageindex])),
              ],
            ),
          ),
          SizedBox(
            width: pageWidth / 60,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: pageHeight / 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: widget.namepadding),
                child: Text(
                  populerMusicName[widget.index],
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: pageHeight / 80,
              ),
              Padding(
                padding: EdgeInsets.only(right: widget.textpadding),
                child: Text(
                  artistName[widget.index],
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: pageWidth / 2.7),
            child: IconButton(
                onPressed: widget.onPressed,
                icon: Icon(
                  Icons.add_box_rounded,
                  size: 30,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}

FirebaseAuth auth = FirebaseAuth.instance;

CollectionReference users = FirebaseFirestore.instance.collection('Users');
CollectionReference musics = FirebaseFirestore.instance.collection('Musics');

Widget showUserNameSurname() => FutureBuilder<DocumentSnapshot>(
      future: users.doc(auth.currentUser!.email).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            "${data['userName']} ${data['userSurname']}",
            style: GoogleFonts.poppins(
                color: Colors.black87,
                fontSize: 21,
                fontWeight: FontWeight.bold),
          );
        }

        return Text("loading");
      },
    );

Widget showMusicName(music) => FutureBuilder<DocumentSnapshot>(
      future: users.doc(music.toString()).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            "${data['name']}",
            style: GoogleFonts.poppins(
                color: Colors.black87,
                fontSize: 21,
                fontWeight: FontWeight.bold),
          );
        }

        return Text("loading");
      },
    );
