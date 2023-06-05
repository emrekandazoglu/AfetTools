import 'package:ai_app/secim_ekrani.dart';
import 'package:ai_app/tools_ekrani.dart';
import 'package:flutter/material.dart';

import 'CustomShape.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(accentColor: Colors.grey),
      home: SplashScreen(), // Açılış ekranını göstermek için SplashScreen kullanıyoruz
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 7), // Animasyon süresini 5 saniye olarak ayarlayın
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Animasyon eğrisini belirleyebilirsiniz
    );

    _controller.forward(); // Animasyonu başlatın

    // Animasyon tamamlandığında yeni sayfaya geçmek için bir süre bekleyin
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD4ADFC), // Açılış ekranının arkaplan rengini ayarlayın
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Şirket logosunu buraya ekleyin
              Image.asset(
                'assets/logo.png', // Şirket logosunun dosya yolunu güncelleyin
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
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
    );
  }
}

class HomePage extends StatelessWidget {
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
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 10.0),
                      child: Container(
                        height: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            primary: Colors.red,
                          ),
                          child: Icon(
                            size: 60,
                            Icons.wifi_off,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // Butona tıklanınca gerçekleşecek işlemler
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => tools_ekrani(),
                              ),
                            );
                          },
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
                            primary: Colors.green,
                          ),
                          child: Icon(
                            size: 60,
                            Icons.wifi,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => secim_ekrani(),
                              ),
                            );
                            // Butona tıklanınca gerçekleşecek işlemler
                          },
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
                "Nefes alıyorsan, hala umut var demektir.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: "Pacifico-Regular",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// CustomShape sınıfını buraya ekleyin veya gerekli yere yerleştirin
