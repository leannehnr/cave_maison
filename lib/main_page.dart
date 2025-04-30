import 'package:flutter/material.dart';


class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _selectedIndex = 0; // Index de la page active

  final List<Widget> _vins = [
    //types de vins
  ];
  // quand on choisit un autre type 
  void _onTypeTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _vins[_selectedIndex], // Affiche le type voulu
    );
  }
}