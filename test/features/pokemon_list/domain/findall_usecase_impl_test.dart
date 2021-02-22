import 'package:dartz/dartz.dart';
import 'package:flutter_pokedex/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:flutter_pokedex/features/pokemon_list/domain/errors/usecase_exception.dart';
import 'package:flutter_pokedex/features/pokemon_list/domain/repositories/pokemon_repository.dart';
import 'package:flutter_pokedex/features/pokemon_list/domain/usecases/findall_usecase.dart';
import 'package:flutter_pokedex/features/pokemon_list/domain/usecases/findall_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

main() {
  PokemonRepository _repository;
  FindAllUseCase _usecase;
  final mockPokemons = <Pokemon>[
    Pokemon(id: 1, num: "001", name: "Bulbasaur"),
    Pokemon(id: 2, num: "002", name: "Ivysaur"),
  ];

  setUp(() {
    _repository = MockPokemonRepository();
    _usecase = FindAllUseCaseImpl(_repository);
  });

  test('Should return a pokemon list on a successful findAll', () async {
    when(_repository.findAll()).thenAnswer((_) async => Right(mockPokemons));

    var result = await _usecase.findall();

    expect(result, isA<Right>());
    expect(result.fold(id, id), isA<List<Pokemon>>());
    expect(result.fold(id, (r) => r.length), equals(2));
    verify(_repository.findAll()).called(equals(1));
  });

  test("Should return a failure if findAll fails", () async {
    when(_repository.findAll()).thenAnswer((_) async =>
        Left(UseCaseException("UseCaseException: mock exception")));

    var result = await _usecase.findall();

    expect(result, isA<Left>());
    expect(result.fold(id, id), isA<UseCaseException>());
    expect(result.fold((l) => l.props[0], id), contains("UseCaseException: "));
  });
}
