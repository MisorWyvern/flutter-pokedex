import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_pokedex/features/pokemon_list/presenter/controllers/pokemon_list_controller.dart';
import 'package:mobx/mobx.dart';
part 'pokemon_info_controller.g.dart';

class PokemonInfoController = _PokemonInfoControllerBase
    with _$PokemonInfoController;

abstract class _PokemonInfoControllerBase with Store {
  final listController = Modular.get<PokemonListController>();
}
