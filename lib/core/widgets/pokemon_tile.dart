import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/widgets/pokemon_type_chip.dart';

import 'package:flutter_pokedex/features/pokemon_list/infra/dtos/pokemon_dto.dart';

class PokemonTile extends StatelessWidget {
  final PokemonDTO pokemon;
  final Color backgroundColor;
  final Function onTap;

  const PokemonTile({
    Key key,
    this.pokemon,
    this.backgroundColor = Colors.grey,
    this.onTap,
  })  : assert(pokemon != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 132,
          padding: EdgeInsets.only(left: 16, top: 16),
          decoration: BoxDecoration(
            color: backgroundColor,
            image: DecorationImage(
              image: AssetImage("assets/pokeball20w.png"),
              alignment: Alignment(1.2, 1.2),
              fit: BoxFit.none,
              scale: 2.25,
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
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 96,
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
                      ),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemExtent: 24 + 16.0,
                      itemCount: pokemon.type?.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: (_, i) => PokemonTypeChip(
                          label: pokemon.type[i],
                          backgroundColor: backgroundColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
