import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_pokedex/core/widgets/light_secondary_title.dart';
import 'package:flutter_pokedex/core/widgets/light_small_title.dart';
import 'package:flutter_pokedex/core/widgets/page_header.dart';
import 'package:flutter_pokedex/features/pokemon_list/presenter/controllers/pokemon_info_controller.dart';

class PokemonInfoPage extends StatefulWidget {
  final String id;

  const PokemonInfoPage({Key key, @required this.id})
      : assert(id != null),
        super(key: key);
  @override
  _PokemonInfoPageState createState() => _PokemonInfoPageState();
}

class _PokemonInfoPageState
    extends ModularState<PokemonInfoPage, PokemonInfoController> {
  @override
  Widget build(BuildContext context) {
    final pokemon = controller.listController.pokemonList
        .firstWhere((e) => e.id == int.tryParse(widget.id));
    return PageHeader(
      color: controller.listController.getColorByType(pokemon.type[0]),
      bgImagePath: "assets/pokeball10w.png",
      iconColor: Theme.of(context).textTheme.headline6.color,
      appBarActions: [
        IconButton(icon: Icon(Icons.favorite_border_outlined), onPressed: () {})
      ],
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: LightSecondaryTitle(title: pokemon.name)),
            Text(
              "#${pokemon.num}",
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
