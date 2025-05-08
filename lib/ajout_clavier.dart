import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'wine_card.dart';

Future<File> _getLocalFile() async {
  final dir = await getApplicationDocumentsDirectory();
  return File('${dir.path}/data.json');
}

Future<void> ajouterVin(Vin vin) async {
  final file = await _getLocalFile();
  List<Vin> vins = [];

  if (await file.exists()) {
    final contents = await file.readAsString();
    final decoded = json.decode(contents) as List;
    vins = decoded.map((e) => Vin.fromJson(e)).toList();
  }

  // Générer un nouvel id
  final newId =
      vins.isEmpty
          ? 1
          : vins.map((v) => v.id).reduce((a, b) => a > b ? a : b) + 1;

  final vinAvecId = vin.copyWith(id: newId);
  vins.add(vinAvecId);

  final jsonList = vins.map((v) => v.toJson()).toList();
  await file.writeAsString(json.encode(jsonList));
}

class AjoutClavierPage extends StatelessWidget {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController domaineController = TextEditingController();
  final TextEditingController anneeController = TextEditingController();
  final TextEditingController quantiteController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String? couleurController;

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
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
              ],
            ),
            DropdownButtonFormField<String>(
              value: couleurController,
              decoration: InputDecoration(labelText: 'Couleur'),
              items:
                  ['Rouge', 'Blanc', 'Rosé', 'Bulles']
                      .map(
                        (couleur) => DropdownMenuItem(
                          value: couleur,
                          child: Text(couleur),
                        ),
                      )
                      .toList(),
              onChanged: (value) {
                couleurController = value;
              },
            ),
            TextField(
              controller: quantiteController,
              decoration: InputDecoration(labelText: 'Quantité'),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final nom = nomController.text;
                final domaine = domaineController.text;
                final annee = int.tryParse(anneeController.text) ?? 0;
                final quantite = int.tryParse(quantiteController.text) ?? 0;
                final couleur = couleurController;

                // Charger fichier
                final dir = await getApplicationDocumentsDirectory();
                final file = File('${dir.path}/data.json');

                List<Vin> vins = [];

                if (await file.exists()) {
                  final contents = await file.readAsString();
                  vins =
                      (json.decode(contents) as List)
                          .map((e) => Vin.fromJson(e))
                          .toList();
                }
                if (couleur != null) {
                  // Générer un ID unique
                  final newId =
                      vins.isEmpty
                          ? 1
                          : vins
                                  .map((v) => v.id)
                                  .reduce((a, b) => a > b ? a : b) +
                              1;

                  final nouveauVin = Vin(
                    id: newId,
                    nom: nom,
                    domaine: domaine,
                    annee: annee,
                    couleur: couleur,
                    quantite: quantite,
                  );

                  vins.add(nouveauVin);

                  // Enregistrer
                  final updatedJson = json.encode(
                    vins.map((v) => v.toJson()).toList(),
                  );
                  await file.writeAsString(updatedJson);

                  Navigator.pop(context); // Revenir à la page d'accueil
                }
              },

              child: Text('Valider'),
            ),
          ],
        ),
      ),
    );
  }
}
