import 'package:flutter_pokedex/core/errors/failure.dart';

class RepositoryException implements Failure {
  final String message;

  RepositoryException(this.message);

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;
}
