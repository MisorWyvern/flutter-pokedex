import 'package:dartz/dartz.dart';
import 'package:flutter_pokedex/core/errors/failure.dart';
import 'package:flutter_pokedex/features/pokemon_list/domain/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<Pokemon>>> findAll();
}
