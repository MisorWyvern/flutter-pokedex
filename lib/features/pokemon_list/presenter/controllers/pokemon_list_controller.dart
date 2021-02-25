import 'package:flutter/material.dart';
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

  Color getColorByType(String type) {
    final colorSwatch = 400;
    switch (type) {
      case 'Normal':
        return Colors.brown[colorSwatch];
        break;
      case 'Fire':
        return Colors.red[colorSwatch];
        break;
      case 'Water':
        return Colors.blue[colorSwatch];
        break;
      case 'Grass':
        return Colors.green[colorSwatch];
        break;
      case 'Electric':
        return Colors.amber[colorSwatch];
        break;
      case 'Ice':
        return Colors.cyanAccent[colorSwatch];
        break;
      case 'Fighting':
        return Colors.deepOrange[colorSwatch];
        break;
      case 'Poison':
        return Colors.purple[colorSwatch];
        break;
      case 'Ground':
        return Colors.orange[colorSwatch];
        break;
      case 'Flying':
        return Colors.indigo[colorSwatch];
        break;
      case 'Psychic':
        return Colors.pink[colorSwatch];
        break;
      case 'Bug':
        return Colors.lightGreen[colorSwatch];
        break;
      case 'Rock':
        return Colors.grey[colorSwatch];
        break;
      case 'Ghost':
        return Colors.indigo[colorSwatch];
        break;
      case 'Dark':
        return Colors.brown[colorSwatch];
        break;
      case 'Dragon':
        return Colors.indigo[colorSwatch];
        break;
      case 'Steel':
        return Colors.blueGrey[colorSwatch];
        break;
      case 'Fairy':
        return Colors.pinkAccent[colorSwatch];
        break;
      default:
        return Colors.grey[colorSwatch];
        break;
    }
  }
}
