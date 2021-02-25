import 'package:flutter/material.dart';

class DarkSmallTitle extends StatelessWidget {
  final String title;
  final bool isTextAlignCenter;

  const DarkSmallTitle({
    Key key,
    this.title,
    this.isTextAlignCenter = false,
  })  : assert(title != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          textDirection: TextDirection.ltr,
          textAlign:
              isTextAlignCenter != true ? TextAlign.left : TextAlign.center,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
