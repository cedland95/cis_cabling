import 'package:flutter/material.dart';

class BoutonAction extends StatelessWidget {
  const BoutonAction(
      {Key? key,
      required this.reponse,
      required this.couleur,
      required this.texte})
      : super(key: key);
  final reponse;
  final texte;
  final couleur;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ElevatedButton(
        onPressed: reponse,
        style: ElevatedButton.styleFrom(
            primary: couleur,
            minimumSize: Size(110, 57),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            )),
        child: Center(
          child: Text(
            texte,
            style: const TextStyle(
                fontSize: 15, fontFamily: 'Poppins', color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
