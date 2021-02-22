import 'package:flutter_pokedex/core/errors/failure.dart';

class DatasourceException implements Failure {
  final String message;

  DatasourceException(this.message);

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;
}
