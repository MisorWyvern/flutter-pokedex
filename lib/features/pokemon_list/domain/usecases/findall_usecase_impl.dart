import 'package:dartz/dartz.dart';
import 'package:flutter_pokedex/core/errors/failure.dart';
import 'package:flutter_pokedex/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:flutter_pokedex/features/pokemon_list/domain/errors/usecase_exception.dart';
import 'package:flutter_pokedex/features/pokemon_list/domain/repositories/pokemon_repository.dart';
import 'package:flutter_pokedex/features/pokemon_list/domain/usecases/findall_usecase.dart';

class FindAllUseCaseImpl implements FindAllUseCase {
  final PokemonRepository _repository;

  FindAllUseCaseImpl(this._repository);

  @override
  Future<Either<Failure, List<Pokemon>>> findall() async {
    var result = await _repository.findAll();

    return result.fold(
      (l) =>
          Left(UseCaseException("UseCase Exception: error on find all call")),
      (r) => Right(r),
    );
  }
}
