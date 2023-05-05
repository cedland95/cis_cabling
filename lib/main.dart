import 'package:flutter/material.dart';
//import 'pages/connexion/connexion_page.dart';
//import 'pages/accueil/accueil_page.dart';
import 'pages/detail/activity_page.dart';




void main() => runApp(const CisApp());

class CisApp extends StatelessWidget {
  const CisApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: ConnexionPage(),
      //home: AccueilPage(),
      home: ActivityPage(),


    );
  }
}
