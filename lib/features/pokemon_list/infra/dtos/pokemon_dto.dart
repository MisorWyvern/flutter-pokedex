import 'dart:convert';

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
      'candyCount': candyCount,
      'egg': egg,
      'spawnChance': spawnChance,
      'avgSpawns': avgSpawns,
      'spawnTime': spawnTime,
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
    if (map["nextEvolution"] != null) {
      prevEvolution = List<EvolutionDTO>.from(
          map['nextEvolution']?.map((x) => EvolutionDTO.fromMap(x)));
    }
    if (map["prevEvolution"] != null) {
      prevEvolution = List<EvolutionDTO>.from(
          map['prevEvolution']?.map((x) => EvolutionDTO.fromMap(x)));
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
      candyCount: map['candyCount'] ?? 0,
      egg: map['egg'] ?? "",
      spawnChance: map['spawnChance'] ?? 0.0,
      avgSpawns: map['avgSpawns'] ?? 0.0,
      spawnTime: map['spawnTime'] ?? "",
      multipliers: multipliers,
      weaknesses: weaknesses,
      nextEvolution: nextEvolution,
      prevEvolution: prevEvolution,
    );
  }
}
