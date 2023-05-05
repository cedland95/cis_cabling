import 'package:flutter/material.dart';
import 'taille.dart';
class LogoConnexion extends StatelessWidget {
  const LogoConnexion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(45.0),
      child: Image.asset('assets/images/LogoCIS.png',
            height: displayHeight(context) * 0.08,
            width: displayWidth(context) * 0.08),
    );
  }
}
