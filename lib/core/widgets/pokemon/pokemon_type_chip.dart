import 'package:flutter/material.dart';

class PokemonTypeChip extends StatelessWidget {
  final String label;
  final Color backgroundColor;

  const PokemonTypeChip(
      {Key key, @required this.label, @required this.backgroundColor})
      : assert(label != null),
        assert(backgroundColor != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Chip(
          backgroundColor: backgroundColor.withOpacity(0.6),
          label: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: Theme.of(context).textTheme.headline6.color,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
