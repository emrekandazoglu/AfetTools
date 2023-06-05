

import 'package:ai_app/canta_hesap.dart';
import 'package:ai_app/ses_paketi.dart';
import 'package:ai_app/tavsiye_al.dart';
import 'package:flutter/material.dart';

import 'CustomShape.dart';




class tools_ekrani extends StatelessWidget {
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
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      side: BorderSide(
                        color: const Color(0xFFD4ADFC),
                        width: 2.0,
                      ),
                    ),
                    onPressed: () {
                      // 1. butona tıklanınca gerçekleşecek işlemler
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ses_paketi()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.volume_up,
                          color: const Color(0xFFD4ADFC),
                          size: 70,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Ses Paketi",
                          style: TextStyle(
                            color: const Color(0xFFD4ADFC),
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      side: BorderSide(
                        color: const Color(0xFFD4ADFC),
                        width: 2.0,
                      ),
                    ),
                    onPressed: () {
                      // 2. butona tıklanınca gerçekleşecek işlemler
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => canta_hesap()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_balance_wallet,
                          color: const Color(0xFFD4ADFC),
                          size: 70,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Deprem Çantanı Puanla",
                          style: TextStyle(
                            color: const Color(0xFFD4ADFC),
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      side: BorderSide(
                        color: const Color(0xFFD4ADFC),
                        width: 2.0,
                      ),
                    ),
                    onPressed: () {
                      // 3. butona tıklanınca gerçekleşecek işlemler

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => tavsiye_al()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.question_answer,
                          color: const Color(0xFFD4ADFC),
                          size: 70,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Tavsiye Al",
                          style: TextStyle(
                            color: const Color(0xFFD4ADFC),
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),




    );
  }
}