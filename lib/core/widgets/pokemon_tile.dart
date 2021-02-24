import 'package:flutter/material.dart';

import 'package:flutter_pokedex/features/pokemon_list/infra/dtos/pokemon_dto.dart';

class PokemonTile extends StatelessWidget {
  final PokemonDTO pokemon;
  final Color backgroundColor;

  const PokemonTile({
    Key key,
    this.pokemon,
    this.backgroundColor = Colors.grey,
  })  : assert(pokemon != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        height: 80,
        padding: EdgeInsets.only(left: 16, top: 16),
        decoration: BoxDecoration(
          color: backgroundColor,
          image: DecorationImage(
            image: AssetImage("assets/pokeball.png"),
            alignment: Alignment(1.2, 1.2),
            fit: BoxFit.none,
            scale: 8,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pokemon.name,
              style: Theme.of(context).textTheme.headline6,
            ),
            Expanded(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 100,
                      child: Image.network(
                        pokemon.img,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemExtent: 24 + 16.0,
                    itemCount: pokemon.type?.length ?? 0,
                    shrinkWrap: true,
                    itemBuilder: (_, i) {
                      return Align(
                        alignment: Alignment.bottomLeft,
                        child: Chip(
                            label: Text(
                          pokemon.type[i],
                          style: TextStyle(
                            color: Theme.of(context).textTheme.headline6.color,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
