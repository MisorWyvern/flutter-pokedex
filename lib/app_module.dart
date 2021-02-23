import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_pokedex/features/splash_screen/presenter/splash_screen_module.dart';

import 'app_widget.dart';
import 'features/pokemon_list/pokemon_list_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", module: SplashScreenModule()),
        ModularRouter("/pokelist", module: PokemonListModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
