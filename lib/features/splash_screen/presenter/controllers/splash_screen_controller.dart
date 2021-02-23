import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'splash_screen_controller.g.dart';

class SplashScreenController = _SplashScreenControllerBase
    with _$SplashScreenController;

abstract class _SplashScreenControllerBase with Store {
  final String route = "/pokelist";
  final int navigationDelayInSeconds = 3;

  _SplashScreenControllerBase() {
    Future.delayed(Duration(seconds: navigationDelayInSeconds))
        .then((_) => Modular.to.pushReplacementNamed(route));
  }
}
