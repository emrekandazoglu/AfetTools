import 'package:flutter/material.dart';

import 'CustomShape.dart';

class canta_hesap extends StatefulWidget {
  @override
  _canta_hesapState createState() => _canta_hesapState();
}

class _canta_hesapState extends State<canta_hesap> {
  List<String> selectedItems = [];
  int totalPoints = 0;

  void calculatePoints() {
    // Seçili öğelerin puanlama hesaplaması yapılıyor
    // Her bir öğe eşit puan değerine sahip olduğu için, seçili öğe sayısı toplam puanı belirler
    totalPoints = selectedItems.length;
  }

  void selectItem(String item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    });
  }

  Widget buildItem(String item) {
    final bool isSelected = selectedItems.contains(item);

    return ElevatedButton(
      onPressed: () => selectItem(item),
      child: Column(
        children: [
          Text(
            item,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: isSelected ? const Color(0xFFD4ADFC) : Colors.grey, // Seçili olanlar yeşil, diğerleri gri renkte
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
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
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontFamily: "MonomaniacOne-Regular",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Deprem çantanızda olan ürünleri seçiniz",
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),

              buildItem("Kimlik bilgilerinin olduğu önemli belgelerin\nfotokopileri"),
              buildItem("Ilkyardım çantası"),
              buildItem("Su (kişi başı 4 litre içme suyu)"),
              buildItem("Bozulmayan, kuru gıdalar"),
              buildItem("Radyo"),
              buildItem("Çakı ve makas"),
              buildItem("Şarj cihazı veya yedek bataryalı cep telefonu"),
              buildItem("Ağrı kesici ilaçlar, ishal önleyiciler, laksatifler ve antiasit ilaç grupları"),
              buildItem("El feneri, Pil"),
              buildItem("Düdük"),
              buildItem("Reçeteli ilaçlar"),
              // Diğer maddeler buraya eklenir
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  calculatePoints();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PuanEkran(totalPoints: totalPoints),
                    ),
                  );
                },
                child: Text(
                  "Hesapla",
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF0C134F), // Hesapla butonu rengi
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PuanEkran extends StatelessWidget {
  final int totalPoints;

  const PuanEkran({required this.totalPoints});

  @override
  Widget build(BuildContext context) {
    int integerPoints = (totalPoints * 100 ~/ 11).floor(); // Tam sayı kısmını alır
    String emoji;
    String message;
    Color textColor;

    if (integerPoints >= 0 && integerPoints < 20) {
      emoji = "😔";
      message = "Deprem çantanızda çok fazla eksik bulunuyor. Lütfen eksiklerini tamamlayınız burada listede olmayan hayati eşyalarınızıda eklemeyi unutmayınız.";
      textColor = Colors.red;
    } else if (integerPoints >= 20 && integerPoints < 40) {
      emoji = "😞";
      message = "Deprem çantanızda çok fazla eksik bulunuyor. Lütfen eksiklerini tamamlayınız burada listede olmayan hayati eşyalarınızıda eklemeyi unutmayınız.";
      textColor = Colors.orange;
    } else if (integerPoints >= 40 && integerPoints < 60) {
      emoji = "😐";
      message = "Deprem çantanızda eksikler bulunuyor. Lütfen onları tamamlayınız.";
      textColor = Colors.yellow;
    } else if (integerPoints >= 60 && integerPoints < 80) {
      emoji = "🙂";
      message = "Deprem çantanız oldukça iyi görünüyor fakat daha iyisini yapabilirsiniz.";
      textColor = Colors.green;
    } else {
      emoji = "😄";
      message = "Deprem çantınız oldukça iyi görünüyor";
      textColor = Colors.green;
    }

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Toplam Puan: $integerPoints/100",
              style: TextStyle(fontSize: 33, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              emoji,
              style: TextStyle(fontSize: 70),
            ),
            SizedBox(height: 10),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
