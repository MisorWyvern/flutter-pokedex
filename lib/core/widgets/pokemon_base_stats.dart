import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/widgets/dark_small_title.dart';
import 'package:flutter_pokedex/core/widgets/info_row.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/dtos/pokemon_dto.dart';

class PokemonBaseStats extends StatelessWidget {
  final PokemonDTO pokemon;

  const PokemonBaseStats({Key key, @required this.pokemon})
      : assert(pokemon != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    String multipliers = "";
    pokemon.multipliers.forEach((element) {
      multipliers = multipliers + "$element\n";
    });
    if (multipliers != "")
      multipliers = multipliers.substring(0, multipliers.length - 1);

    String types = "";
    pokemon.type.forEach((element) {
      types = types + "$element\n";
    });
    if (types != "") types = types.substring(0, types.length - 1);

    String weaknesses = "";
    pokemon.weaknesses.forEach((element) {
      weaknesses = weaknesses + "$element\n";
    });
    if (weaknesses != "")
      weaknesses = weaknesses.substring(0, weaknesses.length - 1);

    return SingleChildScrollView(
      child: Column(
        children: [
          DarkSmallTitle(
            title: "Info",
          ),
          InfoRow(subtitle: "Number", text: "${pokemon.num}"),
          InfoRow(subtitle: "Name", text: pokemon.name),
          InfoRow(subtitle: "Types", text: types),
          InfoRow(subtitle: "Height", text: pokemon.height),
          InfoRow(subtitle: "Weight", text: pokemon.weight),
          InfoRow(subtitle: "Candy", text: pokemon.candy),
          InfoRow(subtitle: "Candy Count", text: "${pokemon.candyCount}"),
          InfoRow(subtitle: "Egg Hatch Distance", text: pokemon.egg),
          InfoRow(
              subtitle: "Spawn Chance",
              text: pokemon.spawnChance.toStringAsFixed(2)),
          InfoRow(
              subtitle: "Average Spawns",
              text: pokemon.avgSpawns.toStringAsFixed(2)),
          InfoRow(subtitle: "Spawn Time", text: pokemon.spawnTime),
          InfoRow(subtitle: "Multipliers", text: multipliers),
          InfoRow(subtitle: "Weaknesses", text: weaknesses),
        ],
      ),
    );
  }
}
