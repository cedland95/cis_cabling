import 'package:flutter/material.dart';

import '../couleurs/color.dart';
import 'widgetConnexion/champ_connexion.dart';
import 'widgetConnexion/image_connexion.dart';
import 'widgetConnexion/logo_connexion.dart';
import 'widgetConnexion/taille.dart';
class ConnexionPage extends StatefulWidget {
  const ConnexionPage({Key? key}) : super(key: key);

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  String login = '';
  String motDePass = '';
  final _formkey =GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const LogoConnexion(),
                const ImageConnexion(),
                const SizedBox(height: 45,),
                const ChampConnexion(),
                const SizedBox(height: 40,),
                InkWell(
                  onTap: (){
                    if(_formkey.currentState!.validate()){
                      emailController.clear();
                      passController.clear();
                    }
                  },
                  child: Container(
                    height: displayHeight(context) * 0.08,
                    decoration: BoxDecoration(
                        color: textColor,
                        borderRadius: BorderRadius.circular(8.0)
                    ),

                    child:  const Center(
                      child: Text('LOGARE',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            color: Colors.white
                        ),
                        textAlign: TextAlign.center,),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
