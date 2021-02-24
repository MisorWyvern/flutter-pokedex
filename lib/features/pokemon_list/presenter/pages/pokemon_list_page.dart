import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_pokedex/core/widgets/light_secondary_title.dart';
import 'package:flutter_pokedex/core/widgets/pokemon_tile.dart';
import 'package:flutter_pokedex/features/pokemon_list/presenter/controllers/pokemon_list_controller.dart';

class PokemonListPage extends StatefulWidget {
  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState
    extends ModularState<PokemonListPage, PokemonListController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        image: DecorationImage(
          image: AssetImage("assets/pokeball.png"),
          alignment: Alignment(1, -1),
          fit: BoxFit.none,
          scale: 3,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 2 * 8.0,
          left: 2 * 8.0,
          right: 2 * 8.0,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.list,
                    color: Colors.black87,
                  ),
                  onPressed: () {})
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: LightSecondaryTitle(title: "Pokedex"),
                  ),
                  FutureBuilder(
                    initialData: [],
                    future: controller.updatePokemonList(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return Expanded(
                        child: GridView.builder(
                          itemCount: controller.pokemonList?.length ?? 0,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            maxCrossAxisExtent: 320,
                          ),
                          itemBuilder: (_, index) {
                            return PokemonTile(
                              pokemon: controller.pokemonList[index],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
