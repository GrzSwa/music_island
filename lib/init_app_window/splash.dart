import 'package:ai_desktop_chat/init_app_window/splashController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SplashController _splashController = SplashController();
  String _svgLogo = 'assets/ChatGPT.svg';
  String _svgCompany = 'assets/OpenAI.svg';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Stack(
          children: [
            Container(
              width: _splashController.getWidth,
              height: _splashController.getHeigth,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(16, 163, 127, 1),
                  Color.fromRGBO(52, 53, 65, 1),
                ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 100),
              child: Center(
                  child: Column(children: [
                SvgPicture.asset(
                  _svgLogo,
                  width: _splashController.getWidth / 4,
                  height: _splashController.getHeigth / 4,
                  color: const Color.fromRGBO(236, 236, 241, 1),
                ),
                SizedBox(
                  height: 60,
                  width: _splashController.getWidth,
                ),
                const SpinKitThreeBounce(
                  color: Colors.white,
                  size: 15,
                )
              ])),
            ),
            Container(
              width: _splashController.getWidth,
              height: _splashController.getHeigth,
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                _svgCompany,
                width: _splashController.getWidth / 8,
                height: _splashController.getHeigth / 9,
                color: const Color.fromRGBO(236, 236, 241, 1),
              ),
            ),
          ],
        )));
  }
}
