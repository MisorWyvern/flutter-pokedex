import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_pokedex/features/splash_screen/presenter/controllers/splash_screen_controller.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState
    extends ModularState<SplashScreenPage, SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.redAccent,
              Colors.red,
            ])),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 64,
            ),
            Text(
              "Flutter Pokedex",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }
}
