import 'dart:async';
import 'package:ai_desktop_chat/init_app_window/splashController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final SplashController _splashController = SplashController();
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final String _svgLogo = 'assets/ChatGPT.svg';
  final String _svgCompany = 'assets/OpenAI.svg';

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  Future<void> initConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.wifi ||
        connectivityResult != ConnectivityResult.ethernet) {
      print('Couldn\'t check connectivity status');
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(connectivityResult);
  }

  @override
  initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Widget OnlineWidget() {
    if (_connectionStatus.name.toString().toLowerCase() == 'wifi' ||
        _connectionStatus.name.toString().toLowerCase() == 'ethernet') {
      return const SpinKitThreeBounce(
        color: Colors.white,
        size: 15,
      );
    }
    return const Text(
      'No internet connection',
      style: TextStyle(
        color: Color.fromRGBO(236, 236, 241, 1),
      ),
    );
  }

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
                OnlineWidget(),
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
