import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/widgets/dark_small_title.dart';
import 'package:flutter_pokedex/core/widgets/pokemon/evolution_row.dart';
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

    return SingleChildScrollView(
      child: Column(
        children: [
          DarkSmallTitle(title: "Evolution Chain"),
          SizedBox(
            height: 2 * 8.0,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount:
                  evolutionChain.length != 0 ? evolutionChain.length - 1 : 0,
              itemBuilder: (_, i) {
                return Column(
                  children: [
                    EvolutionRow(
                      currentEvo: evolutionChain[i],
                      nextEvo: evolutionChain[i + 1],
                      evoLevel: (16 * (i + 1)) + (i * (i + 1)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Divider(
                        thickness: 1,
                        color: Colors.black12,
                      ),
                    ),
                  ],
                );
              }),
          SizedBox(
            height: 2 * kBottomNavigationBarHeight,
          ),
        ],
      ),
    );
  }
}
