import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_pokedex/core/mappers/mapper.dart';
import 'package:flutter_pokedex/features/pokemon_list/domain/repositories/pokemon_repository.dart';
import 'package:flutter_pokedex/features/pokemon_list/domain/usecases/findall_usecase.dart';
import 'package:flutter_pokedex/features/pokemon_list/domain/usecases/findall_usecase_impl.dart';
import 'package:flutter_pokedex/features/pokemon_list/external/datasources/dio/pokemon_datasource_impl.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/datasources/pokemon_datasource.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/mapper/pokemon_mapper.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/repositories/pokemon_repository_impl.dart';
import 'package:flutter_pokedex/features/pokemon_list/presenter/controllers/pokemon_list_controller.dart';
import 'package:flutter_pokedex/features/pokemon_list/presenter/pages/pokemon_list_page.dart';

class PokemonListModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<PokemonDatasource>((i) => PokemonDatasourceImpl()),
        Bind<Mapper>((i) => PokemonMapper()),
        Bind<PokemonRepository>((i) => PokemonRepositoryImpl(i.get(), i.get())),
        Bind<FindAllUseCase>((i) => FindAllUseCaseImpl(i.get())),
        Bind<PokemonListController>(
            (i) => PokemonListController(i.get(), i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (_, __) => PokemonListPage()),
      ];

  static Inject get to => Inject<PokemonListModule>.of();
}
