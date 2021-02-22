import 'package:dartz/dartz.dart';
import 'package:flutter_pokedex/core/mappers/mapper.dart';
import 'package:flutter_pokedex/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:flutter_pokedex/features/pokemon_list/domain/repositories/pokemon_repository.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/datasources/pokemon_datasource.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/dtos/pokemon_dto.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/errors/datasource_exception.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/errors/repository_exception.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/mapper/pokemon_mapper.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/repositories/pokemon_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockPokemonDatasource extends Mock implements PokemonDatasource {}

main() {
  PokemonRepository _repository;
  PokemonDatasource _mockDatasource;
  Mapper _mapper;
  final mockDtoList = <PokemonDTO>[
    PokemonDTO(id: 1, num: "001", name: "Bulbasaur"),
    PokemonDTO(id: 2, num: "002", name: "Ivysaur"),
  ];

  setUp(() {
    _mockDatasource = MockPokemonDatasource();
    _mapper = PokemonMapper();
    _repository = PokemonRepositoryImpl(_mockDatasource, _mapper);
  });

  group("Test: findAll()", () {
    test('Should return a pokemon list on a successful findAll', () async {
      when(_mockDatasource.findAll()).thenAnswer((_) async => mockDtoList);

      var result = await _repository.findAll();

      expect(result, isA<Right>());
      expect(result.fold(id, id), isA<List<Pokemon>>());
      expect(result.fold(id, (r) => r.length), equals(2));
      verify(_mockDatasource.findAll()).called(1);
    });

    test("Should return a failure if findAll fails", () async {
      var result = await _repository.findAll();

      expect(result, isA<Left>());
      expect(result.fold(id, id), isA<RepositoryException>());
      expect(result.fold((l) => l.props[0], id),
          contains("RepositoryException: "));
    });

    test("Should return a failure if datasource throws an exception", () async {
      when(_mockDatasource.findAll()).thenThrow(Exception("mock"));

      var result = await _repository.findAll();

      expect(result, isA<Left>());
      expect(result.fold(id, id), isA<DatasourceException>());
      expect(result.fold((l) => l.props[0], id),
          contains("DatasourceException: "));
    });
  });
}
