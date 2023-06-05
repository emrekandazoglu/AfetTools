import 'package:flutter/material.dart';

import 'CustomShape.dart';

class tavsiye_al extends StatefulWidget {
  @override
  State<tavsiye_al> createState() => _tavsiye_alState();
}

class _tavsiye_alState extends State<tavsiye_al> {
  List<String> cevaplarListesi = [];
  final Map<int, String> sorular = {
    1: "Acı çekiyor musunuz?",
    2: "Hareket edebiliyor musunuz?",
    3: "Nefes almakta zorlanıyor musunuz?",
    4: "Yaralanmanız var mı?",
    5: "Sizinle beraber başkaları da var mı?",
    6: "Sesler duyabiliyor musunuz?",
    7: "Işık görebiliyor musunuz?",
    8: "Telefonunuzda piliniz var mı?",
    9: "Enkaz altında ne kadar süredir bekliyorsunuz?",
  };
  final Map<int, String> evetCevaplari = {
    1: "Acil tıbbi yardım gerektirebilir, sakin kalmalarını ve mümkün olduğunca rahatlamalarını önerin.",
    2: "Dikkatli hareket etmelerini önerin, fazla hareket yaralanmayı ağırlaştırabilir.",
    3: "Mümkünse, nefes almayı kolaylaştıracak bir pozisyon almayı deneyin.",
    4: "Yaralarını mümkünse bir bez veya giysi parçası ile sarın.",
    5: "Başkalarının da durumunu kontrol etmeye çalışın ve herkesin yardım talebinde bulunmasını önerin.",
    6: "Sesleri takip ederek yardımın nereden gelebileceğini anlamaya çalışın.",
    7: "Işığın olduğu yeri, yardımın nereden gelebileceği hakkında bir işaret olarak kullanın.",
    8: "Telefonlarındaki pili acil durumlar için saklamalarını önerin.",
    9: "Zaman geçtikçe, enerjilerini korumaları ve sakin kalmaları daha da önemli hale gelir.",
  };
  final Map<int, String> hayirCevaplari = {
    1: "Bunun iyi bir işaret olduğunu, ancak yine de sakin kalmaları ve enerjilerini korumaları gerektiğini belirtin.",
    2: "Fazla hareket etmemelerini, yardımın gelmesini beklemelerini önerin.",
    3: "Nefes almakta zorlanıyorlarsa, mümkünse havalandırmayı artırmak için bulundukları konumu değiştirmeye çalışmalarını önerin.",
    4: "Yaralanmaları yoksa, bu iyi bir haber. Ancak hala dikkatli olmaları ve herhangi bir hareketin yaralanmaya neden olabileceğini anlamaları önemlidir.",
    5: "Tek başına olduklarını bilmek, enerjilerini koruma konusunda onlara yardımcı olabilir. Yardım gelene kadar sakin kalmalarını tavsiye edin.",
    6: "Ses duyamıyorlarsa, enerjilerini korumak için gürültü yapmaktan kaçınmalarını önerin.",
    7: "Etraflarında ışık görmüyorlarsa, telefonlarını bir ışık kaynağı olarak kullanabilirler, ancak batarya ömrünü korumak da önemlidir.",
    8: "Pil yoksa, enerjilerini korumak ve yardım gelene kadar sakin kalmak çok önemlidir.",
    9: "Enkaz altında uzun bir süre geçirdiyse, sakin kalmaları ve enerjilerini korumaları daha da önemli hale gelir.",
  };

  int soruIndex = 0;

  void cevapEkle(String cevap) {
    setState(() {
      if (soruIndex >= 1 && soruIndex <= sorular.length) {
        int index = soruIndex;
        if (cevap == 'Evet') {
          cevaplarListesi.add(evetCevaplari[index] ?? '');
        } else if (cevap == 'Hayır') {
          cevaplarListesi.add(hayirCevaplari[index] ?? '');
        }
      }
      soruIndex++;
    });
  }

  void resetle() {
    setState(() {
      cevaplarListesi.clear();
      soruIndex = 0;
    });
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
                        fontFamily: "MonomaniacOne-Regular"),
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
            children: <Widget>[
              if (soruIndex == 0)
                ElevatedButton.icon(
                  onPressed: () => cevapEkle('Başla'),
                  icon: Icon(Icons.play_arrow, size: 70),
                  label: Text('Teste Başla', style: TextStyle(fontSize: 30)),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFD4ADFC), // D4ADFC
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              if (soruIndex > 0 && soruIndex <= sorular.length)
                Text(
                  sorular[soruIndex] ?? '',
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              if (soruIndex > 0 && soruIndex <= sorular.length)
                SizedBox(height: 20.0),
              if (soruIndex > 0 && soruIndex <= sorular.length)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => cevapEkle('Evet'),
                      icon: Icon(Icons.check, size: 40),
                      label: Text('Evet', style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // Yeşil
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    ElevatedButton.icon(
                      onPressed: () => cevapEkle('Hayır'),
                      icon: Icon(Icons.close, size: 40),
                      label: Text('Hayır', style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Kırmızı
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ],
                ),
              if (soruIndex > sorular.length)
                Container(
                  color: Color(0xFF0C134F), // D4ADFC
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    cevaplarListesi.join('\n'),
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              if (soruIndex > sorular.length) SizedBox(height: 20.0),
              if (soruIndex > sorular.length)
                ElevatedButton.icon(
                  onPressed: resetle,
                  icon: Icon(Icons.refresh, size: 30),
                  label: Text('Tekrar Başlat', style: TextStyle(fontSize: 25)),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFD4ADFC), // D4ADFC
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
