import 'package:flutter/material.dart';

class AjoutClavierPage extends StatelessWidget {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController domaineController = TextEditingController();
  final TextEditingController anneeController = TextEditingController();
  final TextEditingController quantiteController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cave à vin'),
        backgroundColor: Color(0xFF7B1E3A),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Container(width: 80, height: 80, color: Colors.grey),
            TextField(
              controller: nomController,
              decoration: InputDecoration(labelText: 'Nom'),
            ),
            TextField(
              controller: domaineController,
              decoration: InputDecoration(labelText: 'Domaine'),
            ),
            TextField(
              controller: anneeController,
              decoration: InputDecoration(labelText: 'Année'),
            ),
            TextField(
              controller: quantiteController,
              decoration: InputDecoration(labelText: 'Quantité'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: valider les données
              },
              child: Text('Valider'),
            ),
          ],
        ),
      ),
    );
  }
}
