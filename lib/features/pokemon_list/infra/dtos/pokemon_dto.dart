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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'num': num,
      'name': name,
      'img': img,
      'type': type,
      'height': height,
      'weight': weight,
      'candy': candy,
      'candy_count': candyCount,
      'egg': egg,
      'spawn_chance': spawnChance,
      'avg_spawns': avgSpawns,
      'spawn_time': spawnTime,
      'multipliers': multipliers,
      'weaknesses': weaknesses,
      'nextEvolution': nextEvolution?.map((x) => x?.toMap())?.toList(),
      'prevEvolution': prevEvolution?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory PokemonDTO.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    List<String> type = [];
    List<double> multipliers = [];
    List<String> weaknesses = [];
    List<EvolutionDTO> nextEvolution = [];
    List<EvolutionDTO> prevEvolution = [];

    if (map["type"] != null) {
      type = List<String>.from(map['type']);
    }
    if (map["multipliers"] != null) {
      multipliers = List<double>.from(map['multipliers']);
    }
    if (map["weaknesses"] != null) {
      weaknesses = List<String>.from(map['weaknesses']);
    }
    if (map["next_evolution"] != null) {
      prevEvolution = List<EvolutionDTO>.from(
          map['next_evolution']?.map((x) => EvolutionDTO.fromMap(x)));
    }
    if (map["prev_evolution"] != null) {
      prevEvolution = List<EvolutionDTO>.from(
          map['prev_evolution']?.map((x) => EvolutionDTO.fromMap(x)));
    }

    return PokemonDTO(
      id: map['id'],
      num: map['num'] ?? "",
      name: map['name'] ?? "",
      img: map['img'] ?? "",
      type: type,
      height: map['height'] ?? "",
      weight: map['weight'] ?? "",
      candy: map['candy'] ?? "",
      candyCount: map['candy_count'] ?? 0,
      egg: map['egg'] ?? "",
      spawnChance:
          map['spawn_chance'] != null ? map["spawn_chance"] * 1.0 : 0.0,
      avgSpawns: map['avg_spawns'] != null ? map['avg_spawns'] * 1.0 : 0.0,
      spawnTime: map['spawn_time'] ?? "",
      multipliers: multipliers,
      weaknesses: weaknesses,
      nextEvolution: nextEvolution,
      prevEvolution: prevEvolution,
    );
  }
}
