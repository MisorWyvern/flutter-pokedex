import 'package:dartz/dartz.dart';
import 'package:flutter_pokedex/core/errors/failure.dart';
import 'package:flutter_pokedex/features/pokemon_list/domain/entities/pokemon.dart';

abstract class FindAllUseCase {
  Future<Either<Failure, List<Pokemon>>> findall();
}
