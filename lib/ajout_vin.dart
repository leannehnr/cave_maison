import 'package:flutter/material.dart';

class ChoixAjoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cave à vin',
          style: TextStyle(color: Color(0xFFF5F0E6), fontSize: 64),
        ),
        backgroundColor: Color(0xFF7B1E3A),
        toolbarHeight: 100,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {}, // futur scan
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF7B1E3A)),
                fixedSize: MaterialStateProperty.all(Size(300, 120)),
              ),
              child: Text(
                'Scan',
                style: TextStyle(color: Color(0xFFFDF8E7), fontSize: 36),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ajout_clavier');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF7B1E3A)),
                fixedSize: MaterialStateProperty.all(Size(300, 120)),
              ),
              child: Text(
                'Clavier',
                style: TextStyle(color: Color(0xFFFDF8E7), fontSize: 36),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
