import 'dart:convert';

import 'package:flutter_pokedex/features/pokemon_list/infra/dtos/evolution_dto.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/dtos/pokemon_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/mocks/mock_api.dart';

main() {
  var response = jsonDecode(jsonData);
  var pokemaplist = response["pokemon"];
  var pokemap = pokemaplist[0];
  var pokeDTO = PokemonDTO(
      id: 1,
      num: "001",
      name: "Bulbasaur",
      img: "http://www.serebii.net/pokemongo/pokemon/001.png",
      type: ["Grass", "Poison"],
      height: "0.71 m",
      weight: "6.9 kg",
      candy: "Bulbasaur Candy",
      candyCount: 25,
      egg: "2 km",
      spawnChance: 0.69,
      avgSpawns: 69.0,
      spawnTime: "20:00",
      multipliers: [1.58],
      weaknesses: ["Fire", "Ice", "Flying", "Psychic"],
      prevEvolution: [],
      nextEvolution: [
        EvolutionDTO(num: "002", name: "Ivysaur"),
        EvolutionDTO(num: "003", name: "Venusaur"),
      ]);

  test("Should convert dto from map", () {
    var dto = PokemonDTO.fromMap(pokemap);

    expect(dto, pokeDTO);
  });

  test("Should conver map to dto", () {
    var map = pokeDTO.toMap();

    expect(map, {
      'id': 1,
      'num': '001',
      'name': 'Bulbasaur',
      'img': 'http://www.serebii.net/pokemongo/pokemon/001.png',
      'type': ['Grass', 'Poison'],
      'height': '0.71 m',
      'weight': '6.9 kg',
      'candy': 'Bulbasaur Candy',
      'candy_count': 25,
      'egg': '2 km',
      'spawn_chance': 0.69,
      'avg_spawns': 69.0,
      'spawn_time': '20:00',
      'multipliers': [1.58],
      'weaknesses': ['Fire', 'Ice', 'Flying', 'Psychic'],
      'nextEvolution': [
        {'num': '002', 'name': 'Ivysaur'},
        {'num': '003', 'name': 'Venusaur'}
      ],
      'prevEvolution': []
    });
  });
}
