import 'package:flutter_pokedex/core/mappers/mapper.dart';
import 'package:flutter_pokedex/features/pokemon_list/domain/entities/evolution.dart';
import 'package:flutter_pokedex/features/pokemon_list/infra/dtos/evolution_dto.dart';

class EvolutionMapper implements Mapper<EvolutionDTO, Evolution> {
  @override
  Evolution from([EvolutionDTO dto]) {
    return Evolution(
      num: dto.num ?? "",
      name: dto.name ?? "",
    );
  }

  @override
  EvolutionDTO to([Evolution evo]) {
    return EvolutionDTO(
      num: evo.num ?? "",
      name: evo.name ?? "",
    );
  }
}
