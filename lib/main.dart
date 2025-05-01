import 'package:flutter/material.dart';
import 'accueil_page.dart';
import 'ajout_vin.dart';
import 'ajout_clavier.dart';

void main() {
  runApp(CaveAVinApp());
}

class CaveAVinApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cave à vin',
      theme: ThemeData(
        primaryColor: Color(0xFF7B1E3A),
        scaffoldBackgroundColor: Color(0xFFFDF8E7),
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => AccueilPage(),
        '/ajout': (context) => ChoixAjoutPage(),
        '/ajout_clavier': (context) => AjoutClavierPage(),
      },
    );
  }
}
