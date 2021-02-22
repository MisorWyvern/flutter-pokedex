import 'package:flutter_pokedex/core/errors/failure.dart';

class UseCaseException implements Failure {
  final String message;

  UseCaseException(this.message);

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;
}
