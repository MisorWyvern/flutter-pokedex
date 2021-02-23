import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/datasources/pokemon_datasource.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/dtos/pokemon_dto.dart';

class PokemonDatasourceImpl implements PokemonDatasource {
  Dio httpClient;
  final path =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  PokemonDatasourceImpl([this.httpClient]) {
    this.httpClient = httpClient ?? Dio();
  }

  @override
  Future<List<PokemonDTO>> findAll() async {
    var response = await httpClient.get(path);

    if (response.statusCode != 200) {
      throw Exception("Datasource failed to get data on findAll.");
    }

    final List<PokemonDTO> pokemonList = [];
    var json = jsonDecode(response.data);
    var rawList = json["pokemon"];
    for (var map in rawList) {
      pokemonList.add(PokemonDTO.fromMap(map));
    }

    return pokemonList;
  }
}
