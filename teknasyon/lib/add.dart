import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teknasyon/widgets.dart';

class AddPage extends StatefulWidget {
  final VoidCallback? press;

  const AddPage({Key? key, this.press}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  Widget SearchBar() => TextField(
        controller: link,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          hintText: "Müzik linkle",
          hintStyle: GoogleFonts.poppins(color: Colors.black87, fontSize: 17),
          prefixIcon: Icon(
            Icons.link_rounded,
            color: Colors.black87,
            size: 35,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.send),
            onPressed: sendLink,
          ),
        ),
      );

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference links = FirebaseFirestore.instance.collection('Links');

  TextEditingController link = TextEditingController();

  int sureSayaci = 0;

  sendLink() {
    sureSayaci++;

    if (sureSayaci >= 2) {
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
      FirebaseFirestore.instance
          .collection("Links")
          .doc(auth.currentUser!.email)
          .set({
        "userid": auth.currentUser!.uid,
        "userMail": auth.currentUser!.email,
        "link": link.text,
      });

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.white,
          title: Text("Linklendi!"),
          content: Text("Şarkın başarıyla linklendi!"),
          actions: [
            MaterialButton(
                child: Text(
                  "Tamam",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                ),
                shape: StadiumBorder(),
                minWidth: 100,
                height: 40,
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        ),
      );
    }
  }

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: SearchBar(),
              ),
              Padding(
                padding: EdgeInsets.only(right: pageWidth / 1.9),
                child: Text(
                  "Bu aralar popüler",
                  style: GoogleFonts.archivo(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: pageHeight / 50,
              ),
              MusicCard(
                imageindex: 0,
                namepadding: pageWidth / 300,
                textpadding: pageWidth / 15,
                index: 0,
                onPressed: widget.press,
              ),
              SizedBox(
                height: pageHeight / 50,
              ),
              MusicCard(
                imageindex: 1,
                namepadding: pageWidth / 300,
                textpadding: pageWidth / 7,
                index: 1,
                onPressed: widget.press,
              ),
              SizedBox(
                height: pageHeight / 50,
              ),
              MusicCard(
                imageindex: 2,
                namepadding: pageWidth / 300,
                textpadding: pageWidth / 53,
                index: 2,
                onPressed: widget.press,
              ),
              SizedBox(
                height: pageHeight / 50,
              ),
              MusicCard(
                imageindex: 3,
                namepadding: pageWidth / 300,
                textpadding: pageWidth / 30,
                index: 3,
                onPressed: widget.press,
              ),
              SizedBox(
                height: pageHeight / 50,
              ),
              MusicCard(
                imageindex: 4,
                namepadding: pageWidth / 300,
                textpadding: pageWidth / 9,
                index: 4,
                onPressed: widget.press,
              ),
              SizedBox(
                height: pageHeight / 50,
              ),
              MusicCard(
                imageindex: 5,
                namepadding: pageWidth / 300,
                textpadding: pageWidth / 9,
                index: 5,
                onPressed: widget.press,
              ),
              SizedBox(
                height: pageHeight / 50,
              ),
              SizedBox(
                height: pageHeight / 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
