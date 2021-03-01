import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  final Color color;
  final List<Widget> appBarActions;
  final Widget child;
  final String bgImagePath;
  final Color iconColor;
  final double horizontalPadding;

  const PageHeader({
    Key key,
    this.color,
    this.appBarActions = const [],
    this.child,
    this.bgImagePath,
    this.iconColor,
    this.horizontalPadding = 16.0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color != null ? color : Theme.of(context).backgroundColor,
      ),
      child: Stack(
        children: [
          Positioned(
            top: -65,
            right: -92.50,
            child: Image.asset(
              bgImagePath != null ? bgImagePath : "assets/pokeball10.png",
              fit: BoxFit.none,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 2 * 8.0,
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                iconTheme: IconThemeData(
                    color: iconColor != null
                        ? iconColor.withOpacity(0.87)
                        : Colors.black87),
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                actions: [
                  ...appBarActions,
                  SizedBox(
                    width: 8,
                  )
                ],
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: child != null ? child : Container(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
