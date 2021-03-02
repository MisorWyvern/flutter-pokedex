import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_pokedex/features/pokemon_list/infra/dtos/evolution_dto.dart';

class EvolutionRow extends StatelessWidget {
  final EvolutionDTO currentEvo;
  final EvolutionDTO nextEvo;
  final int evoLevel;

  const EvolutionRow({
    Key key,
    @required this.currentEvo,
    @required this.nextEvo,
    this.evoLevel = 0,
  })  : assert(currentEvo != null),
        assert(nextEvo != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
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
                    currentEvo.num +
                    ".png",
                progressIndicatorBuilder: (_, __, downloadProgress) =>
                    CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
                errorWidget: (_, __, ___) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                currentEvo.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.arrow_forward,
              color: Colors.black12,
            ),
            Text(
              "Lvl $evoLevel",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
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
                    nextEvo.num +
                    ".png",
                progressIndicatorBuilder: (_, __, downloadProgress) =>
                    CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
                errorWidget: (_, __, ___) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                nextEvo.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
