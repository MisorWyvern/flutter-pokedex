import 'package:flutter/material.dart';

class LightSecondaryTitle extends StatelessWidget {
  final String title;

  const LightSecondaryTitle({Key key, @required this.title})
      : assert(title != null),
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
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
