import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String subtitle;
  final String text;
  const InfoRow({
    Key key,
    @required this.subtitle,
    @required this.text,
  })  : assert(subtitle != null),
        assert(text != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              width: double.maxFinite,
              child: Text(
                subtitle,
                style: TextStyle(
                    color: Colors.grey[400], fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(child: Text(text))
        ],
      ),
    );
  }
}
