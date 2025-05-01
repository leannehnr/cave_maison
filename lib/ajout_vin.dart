import 'package:flutter/material.dart';

class ChoixAjoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cave à vin'),
        backgroundColor: Color(0xFF7B1E3A),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {}, // futur scan
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF7B1E3A)),
              ),
              child: Text('Scan', style: TextStyle(color: Color(0xFFFDF8E7))),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ajout_clavier');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF7B1E3A)),
              ),
              child: Text(
                'Clavier',
                style: TextStyle(color: Color(0xFFFDF8E7)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
