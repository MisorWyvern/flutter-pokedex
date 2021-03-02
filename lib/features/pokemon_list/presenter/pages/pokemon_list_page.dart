import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_pokedex/core/widgets/dark_small_title.dart';
import 'package:flutter_pokedex/core/widgets/dark_secondary_title.dart';
import 'package:flutter_pokedex/core/widgets/page_header.dart';
import 'package:flutter_pokedex/core/widgets/pokemon_tile.dart';
import 'package:flutter_pokedex/features/pokemon_list/presenter/controllers/pokemon_list_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PokemonListPage extends StatefulWidget {
  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState
    extends ModularState<PokemonListPage, PokemonListController> {
  @override
  Widget build(BuildContext context) {
    return PageHeader(
      appBarActions: [
        IconButton(
            icon: Icon(
              Icons.list,
            ),
            onPressed: () {}),
      ],
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - kToolbarHeight - 8 * 5.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: DarkSecondaryTitle(title: "Pokedex"),
              ),
              FutureBuilder(
                initialData: [],
                future: controller
                    .updatePokemonList()
                    .then((value) => print(value)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DarkSmallTitle(
                            title: "Loading...",
                            isTextAlignCenter: true,
                          ),
                          CircularProgressIndicator(),
                        ],
                      ),
                    );
                  }

                  if (controller.pokemonList.length == 0) {
                    return Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.mood_bad_outlined),
                          DarkSmallTitle(
                            title: "Something went wrong...",
                            isTextAlignCenter: true,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "Verify your connection and press \"Try again\" button...",
                            ),
                          ),
                          RaisedButton(
                            onPressed: controller.updatePokemonList,
                            child: Text("Try again"),
                          ),
                        ],
                      ),
                    );
                  }

                  return Expanded(
                    child: StaggeredGridView.extentBuilder(
                      maxCrossAxisExtent: 180,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      itemBuilder: (_, index) {
                        return PokemonTile(
                          onTap: () => Modular.to.pushNamed(
                              "/pokelist/pokemon/${controller.pokemonList[index].id}"),
                          backgroundColor: controller.getColorByType(
                              controller.pokemonList[index].type[0]),
                          pokemon: controller.pokemonList[index],
                        );
                      },
                      staggeredTileBuilder: (i) => StaggeredTile.fit(1),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
