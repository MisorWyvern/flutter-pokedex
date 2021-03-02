import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/widgets/dark_small_title.dart';
import 'package:flutter_pokedex/core/widgets/info_row.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/dtos/pokemon_dto.dart';

class PokemonAbout extends StatelessWidget {
  final PokemonDTO pokemon;

  const PokemonAbout({Key key, @required this.pokemon})
      : assert(pokemon != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris mollis est turpis, a malesuada ligula ultricies eu. Vivamus at tellus non justo rutrum cursus. Fusce pharetra fermentum condimentum.",
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 16,
            ),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(2 * 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: SizedBox(
                              width: double.maxFinite,
                              child: Text(
                                "Height",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.maxFinite,
                            child: Text(
                              pokemon.height,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: SizedBox(
                              width: double.maxFinite,
                              child: Text(
                                "Weight",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.maxFinite,
                            child: Text(
                              pokemon.weight,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 2 * 8.0),
              child: DarkSmallTitle(
                title: "Breeding",
              ),
            ),
            InfoRow(subtitle: "Candy", text: pokemon.candy),
            InfoRow(subtitle: "Candy Count", text: "${pokemon.candyCount}"),
            InfoRow(subtitle: "Egg Hatch Distance", text: pokemon.egg),
            SizedBox(
              height: kBottomNavigationBarHeight * 2,
            )
          ],
        ),
      ),
    );
  }
}
