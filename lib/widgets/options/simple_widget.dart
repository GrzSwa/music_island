import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SimpleWidget extends StatelessWidget {
  const SimpleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4),
          color: const Color.fromRGBO(0, 0, 0, 0.2),
          child: const ListTile(
            textColor: Colors.white,
            iconColor: Colors.white,
            leading: Icon(FontAwesomeIcons.sdCard),
            title: Text(
              "Change size",
              textScaleFactor: 0.8,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              "kjhasdugaisuhdsaihdiasdjaskldjaslkdjasduhwaidua",
              textScaleFactor: 0.75,
              style: TextStyle(
                color: Color.fromRGBO(236, 236, 241, 0.795),
              ),
            ),
          ),
        ));
  }
}
