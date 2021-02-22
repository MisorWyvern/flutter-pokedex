import 'package:flutter_pokedex/features/pokemon_list/infra/dtos/pokemon_dto.dart';

abstract class PokemonDatasource {
  Future<List<PokemonDTO>> findAll();
}
