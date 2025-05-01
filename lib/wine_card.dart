import 'package:flutter/material.dart';

class WineCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(width: 40, height: 60, color: Colors.white),
        title: Text('Caca prout'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Couleur'),
            Row(
              children: [
                Text('Année'),
                Spacer(),
                Switch(
                  value: true,
                  onChanged: (_) {},
                  activeColor: Color(0xFF7B1E3A),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
