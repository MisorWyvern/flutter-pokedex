import 'package:mobx/mobx.dart';

import 'package:flutter_pokedex/core/mappers/mapper.dart';
import 'package:flutter_pokedex/features/pokemon_list/domain/usecases/findall_usecase.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/dtos/pokemon_dto.dart';

part 'pokemon_list_controller.g.dart';

class PokemonListController = _PokemonListControllerBase
    with _$PokemonListController;

abstract class _PokemonListControllerBase with Store {
  final FindAllUseCase _findAllUseCase;
  final Mapper _mapper;

  _PokemonListControllerBase(
    this._findAllUseCase,
    this._mapper,
  );

  @observable
  ObservableList<PokemonDTO> pokemonList = <PokemonDTO>[].asObservable();

  @action
  Future<String> updatePokemonList() async {
    var result = await _findAllUseCase.findall();

    return result.fold(
      (l) => "Something went wrong: " + l.props[0],
      (r) {
        List<PokemonDTO> dtoList = r.map((e) => _mapper.to(e)).toList().cast();
        pokemonList = dtoList.asObservable();
        return "Pokemon List updated successfully!";
      },
    );
  }
}
