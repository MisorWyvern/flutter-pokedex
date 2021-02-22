import 'package:dartz/dartz.dart';
import 'package:flutter_pokedex/core/errors/failure.dart';
import 'package:flutter_pokedex/core/mappers/mapper.dart';
import 'package:flutter_pokedex/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:flutter_pokedex/features/pokemon_list/domain/repositories/pokemon_repository.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/datasources/pokemon_datasource.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/errors/datasource_exception.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/errors/repository_exception.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDatasource _datasource;
  final Mapper _mapper;

  PokemonRepositoryImpl(this._datasource, this._mapper);

  @override
  Future<Either<Failure, List<Pokemon>>> findAll() async {
    try {
      var result = await _datasource.findAll();

      if (result == null) {
        return Left(RepositoryException(
            "RepositoryException: datasource returned null"));
      }

      List<Pokemon> pokemonList = [];
      pokemonList = result.map((e) => _mapper.from(e)).toList().cast();
      return Right(pokemonList);
    } catch (ex) {
      return Left(DatasourceException("DatasourceException: $ex"));
    }
  }
}
