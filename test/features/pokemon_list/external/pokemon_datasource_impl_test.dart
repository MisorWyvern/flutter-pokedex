import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_pokedex/features/pokemon_list/external/datasources/dio/pokemon_datasource_impl.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/datasources/pokemon_datasource.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/dtos/pokemon_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../core/mocks/mock_api.dart';

class MockDio extends Mock implements Dio {}

main() {
  Dio _mockDio;
  PokemonDatasource _datasource;

  setUp(() {
    _mockDio = MockDio();
    _datasource = PokemonDatasourceImpl(_mockDio);
  });

  test("Should return an PokemonDTO List", () async {
    when(_mockDio.get(any))
        .thenAnswer((_) async => Response(data: jsonData, statusCode: 200));

    var result = await _datasource.findAll();

    expect(result, isA<List<PokemonDTO>>());
  });

  test("Should throw an exception if statusCode is not 200", () async {
    when(_mockDio.get(any))
        .thenAnswer((_) async => Response(data: null, statusCode: 404));

    await expectLater(_datasource.findAll(), throwsException);
  });
}
