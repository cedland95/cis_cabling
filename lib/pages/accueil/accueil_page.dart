import 'package:flutter/material.dart';
import '../couleurs/color.dart';
import 'drawer_page/main_appbar.dart';
import 'travail/travail.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({Key? key}) : super(key: key);

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: MyAppBar(),
      body: const Travail(),
    );
  }
}
