import 'package:flutter/material.dart';

class DashboardMenuItem extends StatelessWidget {
  final Color color;
  final String title;
  final Function onTap;

  const DashboardMenuItem({
    Key key,
    this.color,
    this.title = "Unknown",
    @required this.onTap,
  })  : assert(onTap != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: color,
          ),
          height: 64,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                    color: color.withOpacity(0.55),
                    offset: Offset(0, 5),
                    blurRadius: 6.0,
                    spreadRadius: 1.0)
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  top: -55,
                  left: -55,
                  child: Image.asset(
                    "assets/pokeball20w.png",
                    scale: 3,
                  ),
                ),
                Positioned(
                  top: -10,
                  right: -15,
                  child: Image.asset(
                    "assets/pokeball20w.png",
                    scale: 3,
                  ),
                ),
                Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2 * 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .fontSize *
                                    0.8,
                                color: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .color),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
