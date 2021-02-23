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

  Map<String, dynamic> toMap() {
    return {
      'num': num ?? "",
      'name': name ?? "",
    };
  }

  factory EvolutionDTO.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return EvolutionDTO(
      num: map['num'] ?? "",
      name: map['name'] ?? "",
    );
  }
}
