import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_pokedex/core/widgets/dark_small_title.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/dtos/evolution_dto.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/dtos/pokemon_dto.dart';

class PokemonEvolution extends StatelessWidget {
  final PokemonDTO pokemon;
  const PokemonEvolution({
    Key key,
    this.pokemon,
  })  : assert(pokemon != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final EvolutionDTO currentEvolution =
        EvolutionDTO(name: pokemon.name, num: pokemon.num);
    final List<EvolutionDTO> evolutionChain = [
      ...pokemon.prevEvolution,
      currentEvolution,
      ...pokemon.nextEvolution,
    ];
    print("prevEvolution: $evolutionChain");
    return Column(
      children: [
        DarkSmallTitle(title: "Evolution Chain"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/pokeball10.png"))),
                  child: CachedNetworkImage(
                    imageUrl: "https://www.serebii.net/pokemon/art/" +
                        pokemon.num +
                        ".png",
                    progressIndicatorBuilder: (_, __, downloadProgress) =>
                        CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                    errorWidget: (_, __, ___) => Icon(Icons.error),
                  ),
                )
              ],
            ),
            Column(
              children: [],
            ),
            Column(
              children: [],
            ),
          ],
        )
      ],
    );
  }
}
