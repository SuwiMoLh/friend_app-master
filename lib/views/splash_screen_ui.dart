import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:friend_app/utils/gradient_text.dart';
import 'package:friend_app/views/login_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    // TODO: implement initState
    // คำสั่งในการหน่วงเวลา เพื่อเปิดไปยังหน้า HomeUI
    Future.delayed(
      // ระยะเวลาที่หน่วง
      Duration(
        seconds: 3,
      ),
      // พอครบกำหนดระยะเวลา จะให้เปิดหน้า HomeUI
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginUI(),
        ),
      ),
    );

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.person,
                  size: MediaQuery.of(context).size.width * 0.35,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  'Friend APP',
                  style: GoogleFonts.itim(
                    fontSize: MediaQuery.of(context).size.width * 0.075,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  'บันทึกเพื่อนๆ V.1.0',
                  style: GoogleFonts.itim(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.045,
                ),
                CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GradientText(
                  'Created by AunopDev DTI-SAU',
                  style: GoogleFonts.itim(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                  gradient: LinearGradient(colors: [
                    Colors.grey,
                    Colors.blue,
                    Colors.grey,
                    // Colors.red,
                    // Colors.purple,
                    // Colors.amber,
                    // Colors.pink,
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}