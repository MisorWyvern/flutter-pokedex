import 'package:flutter/material.dart';

class PokemonMoves extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.construction,
                    size: 128,
                  ),
                  Text(
                    "Work in Progress...",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 2 * kBottomNavigationBarHeight,
          ),
        ],
      ),
    );
  }
}
