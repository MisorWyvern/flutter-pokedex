import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_pokedex/core/widgets/light_secondary_title.dart';
import 'package:flutter_pokedex/core/widgets/page_header.dart';
import 'package:flutter_pokedex/core/widgets/pokemon/pokemon_about.dart';
import 'package:flutter_pokedex/core/widgets/pokemon/pokemon_base_stats.dart';
import 'package:flutter_pokedex/core/widgets/pokemon/pokemon_evolution.dart';
import 'package:flutter_pokedex/core/widgets/pokemon/pokemon_moves.dart';
import 'package:flutter_pokedex/core/widgets/pokemon/pokemon_type_chip.dart';
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
      horizontalPadding: 0,
      color: controller.listController.getColorByType(pokemon.type[0]),
      bgImagePath: "assets/pokeball10w.png",
      iconColor: Theme.of(context).textTheme.headline6.color,
      appBarActions: [
        IconButton(icon: Icon(Icons.favorite_border_outlined), onPressed: () {})
      ],
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2 * 8.0),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2 * 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      // child: Text("teste"),
                      child: SizedBox(
                        height: 36,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: pokemon.type?.length ?? 0,
                          shrinkWrap: true,
                          itemBuilder: (_, i) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: PokemonTypeChip(
                                backgroundColor: controller.listController
                                    .getColorByType(pokemon.type[0]),
                                label: pokemon.type[i],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(
                          "Seed Pokemon",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline6.color),
                        )),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            scale: 1.25,
                            image: AssetImage("assets/pokeball10w.png"))),
                    height: 200,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 160),
                    height: MediaQuery.of(context).size.height - 290,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32)),
                      child: DefaultTabController(
                        length: 4,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
                          color: Theme.of(context).backgroundColor,
                          child: Scaffold(
                            appBar: TabBar(
                              labelPadding: EdgeInsets.zero,
                              isScrollable: false,
                              indicatorColor: Colors.blue,
                              indicatorWeight: 3,
                              unselectedLabelColor: Colors.grey[400],
                              labelColor: Colors.black,
                              labelStyle: Theme.of(context).textTheme.bodyText1,
                              tabs: [
                                Tab(
                                  text: "About",
                                ),
                                Tab(
                                  text: "Base Stats",
                                ),
                                Tab(
                                  text: "Evolution",
                                ),
                                Tab(
                                  text: "Moves",
                                ),
                              ],
                            ),
                            body: Padding(
                              padding: const EdgeInsets.all(2 * 8.0),
                              child: TabBarView(children: [
                                PokemonAbout(pokemon: pokemon),
                                PokemonBaseStats(pokemon: pokemon),
                                PokemonEvolution(pokemon: pokemon),
                                PokemonMoves(),
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      height: 200,
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
