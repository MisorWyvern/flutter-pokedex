import 'package:flutter_pokedex/features/pokemon_list/domain/entities/evolution.dart';
import 'package:flutter_pokedex/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/dtos/evolution_dto.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/dtos/pokemon_dto.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/mappers/pokemon_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final mapper = PokemonMapper();
  final pokemonDTO = PokemonDTO(
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

  final pokemon = Pokemon(
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
        Evolution(num: "002", name: "Ivysaur"),
        Evolution(num: "003", name: "Venusaur"),
      ]);
  test("Should convert PokemonDTO to Pokemon", () {
    var poke = mapper.from(pokemonDTO);

    expect(poke, pokemon);
  });

  test("Should convert Pokemon to PokemonDTO", () {
    var dto = mapper.to(pokemon);

    expect(dto, pokemonDTO);
  });
}
