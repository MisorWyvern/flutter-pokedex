import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_pokedex/core/widgets/dark_secondary_title.dart';
import 'package:flutter_pokedex/core/widgets/dashboard_menu_item.dart';
import 'package:flutter_pokedex/core/widgets/page_header.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageHeader(
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - kToolbarHeight - 8 * 5.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 2 * 8.0),
                child: DarkSecondaryTitle(
                    title: "What Pokemon\nare you looking for?"),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2 * 8.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: Theme.of(context).textTheme.bodyText2.color),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(32.0)),
                      fillColor: Colors.grey[300],
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search Pokemon, Move, Ability etc"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    Expanded(
                        child: DashboardMenuItem(
                      title: "Pokedex",
                      color: Colors.green[400],
                      onTap: () => Modular.to.pushNamed("/pokelist"),
                    )),
                    SizedBox(width: 8),
                    Expanded(
                      child: DashboardMenuItem(
                        title: "Moves",
                        color: Colors.red[400],
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  children: [
                    Expanded(
                        child: DashboardMenuItem(
                      title: "Abilities",
                      color: Colors.blue[400],
                      onTap: () {},
                    )),
                    SizedBox(width: 8),
                    Expanded(
                        child: DashboardMenuItem(
                      onTap: () {},
                      title: "Items",
                      color: Colors.amber[400],
                    )),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: DashboardMenuItem(
                    onTap: () {},
                    title: "Locations",
                    color: Colors.purple[400],
                  )),
                  SizedBox(width: 8),
                  Expanded(
                      child: DashboardMenuItem(
                    onTap: () {},
                    title: "Type Charts",
                    color: Colors.brown[400],
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
