import 'package:equatable/equatable.dart';

import 'package:flutter_pokedex/features/pokemon_list/infra/dtos/evolution_dto.dart';

class PokemonDTO extends Equatable {
  final int id;
  final String num;
  final String name;
  final String img;
  final List<String> type;
  final String height;
  final String weight;
  final String candy;
  final int candyCount;
  final String egg;
  final double spawnChance;
  final double avgSpawns;
  final String spawnTime;
  final List<double> multipliers;
  final List<String> weaknesses;
  final List<EvolutionDTO> nextEvolution;
  final List<EvolutionDTO> prevEvolution;

  PokemonDTO({
    this.id,
    this.num,
    this.name,
    this.img,
    this.type,
    this.height,
    this.weight,
    this.candy,
    this.candyCount,
    this.egg,
    this.spawnChance,
    this.avgSpawns,
    this.spawnTime,
    this.multipliers,
    this.weaknesses,
    this.nextEvolution,
    this.prevEvolution,
  });

  @override
  List<Object> get props => [
        id,
        num,
        name,
        img,
        type,
        height,
        weight,
        candy,
        candyCount,
        egg,
        spawnChance,
        avgSpawns,
        spawnTime,
        multipliers,
        weaknesses,
        nextEvolution,
        prevEvolution,
      ];

  @override
  bool get stringify => true;
}
