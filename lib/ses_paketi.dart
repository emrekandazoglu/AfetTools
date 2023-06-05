import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'CustomShape.dart';

class ses_paketi extends StatefulWidget {
  @override
  State<ses_paketi> createState() => _ses_paketiState();
}

class _ses_paketiState extends State<ses_paketi> {
  final oynatici = AudioPlayer();

  void sesiOynat(String sesadi){
    var ses = AssetSource(sesadi);
    oynatici.play(ses);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5C469C),
      appBar: AppBar(
        toolbarHeight: 130,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: Customshape(),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFF0C134F),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "AFET TOOLS",
                    style: TextStyle(fontSize: 40, color: Colors.white, fontFamily: "MonomaniacOne-Regular"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  buildDrumBtn("burdayim", Icons.location_on, const Color(0xFF1D267D), "Burdayım"),
                  buildDrumBtn("duduk", Icons.sports,const Color(0xFF1D267D), "Düdük"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildDrumBtn("ses", Icons.record_voice_over,const Color(0xFF1D267D), "Sesimi duyan var mı?"),
                  buildDrumBtn("tehlike", Icons.volume_up, const Color(0xFF1D267D), "Siren sesi"),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget buildDrumBtn(String drumName, IconData iconData, Color color, String text) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          sesiOynat('$drumName.wav');
        },
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: Colors.white,
                size: 70,
              ),
              SizedBox(height: 10,),

              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: color,
          ),
          width: 500,


        ),

      ),
    );
  }
}


