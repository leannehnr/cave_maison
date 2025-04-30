import 'package:flutter/material.dart';
import 'main_page.dart'; // Page d'accueil

void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(debugShowCheckedModeBanner: false,
    title: 'Cave à vins', 
    theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF5F0E6)),),
    home: MainPage(),
    );
  }
}