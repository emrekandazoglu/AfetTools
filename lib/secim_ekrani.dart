

import 'package:ai_app/tools_ekrani.dart';
import 'package:flutter/material.dart';

import 'CustomShape.dart';
import 'package:ai_app/ai_bot.dart';




class secim_ekrani extends StatelessWidget {
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
                    style: TextStyle(fontSize: 40, color: Colors.white,fontFamily: "MonomaniacOne-Regular"),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Container(
                        height: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            primary: const Color(0xFFD4ADFC),
                          ),
                          onPressed: () {
                            // Butona tıklanınca gerçekleşecek işlemler
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => tools_ekrani()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                size: 60,
                                Icons.build,
                                color: Colors.white,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "ARACLAR",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Container(
                        height: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            primary: const Color(0xFFD4ADFC),
                          ),
                          onPressed: () {
                            // Butona tıklanınca gerçekleşecek işlemler
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ChatGPTScreen()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                size: 60,
                                Icons.smart_toy,
                                color: Colors.white,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "AI BOT",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Devam etmek istediginiz işlem için ilgili butona basınız",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: "MonomaniacOne-Regular",
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}