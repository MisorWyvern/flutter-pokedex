import 'package:equatable/equatable.dart';

class Evolution extends Equatable {
  final String num;
  final String name;

  Evolution({this.num, this.name});

  @override
  List<Object> get props => [num, name];

  @override
  bool get stringify => true;
}
