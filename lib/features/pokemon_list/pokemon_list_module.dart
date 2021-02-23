import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_pokedex/features/pokemon_list/presenter/pages/pokemon_list_page.dart';

class PokemonListModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (_, __) => PokemonListPage()),
      ];

  static Inject get to => Inject<PokemonListModule>.of();
}
