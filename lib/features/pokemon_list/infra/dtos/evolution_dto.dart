import 'package:equatable/equatable.dart';

class EvolutionDTO extends Equatable {
  final String num;
  final String name;

  EvolutionDTO({
    this.num,
    this.name,
  });

  @override
  List<Object> get props => [num, name];

  @override
  bool get stringify => true;
}
