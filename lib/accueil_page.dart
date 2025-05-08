import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'wine_card.dart';

class AccueilPage extends StatefulWidget {
  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  final List<String> categories = ['Rouge', 'Blanc', 'Rosé', 'Bulles'];
  List<bool> isSelected = [true, false, false, false];
  List<Vin> vins = [];

  Future<File> getLocalFile() async {
    final dir =
        await getApplicationDocumentsDirectory(); // récupère le répertoire de l'application
    return File(
      '${dir.path}/data.json',
    ); // crée le fichier vins.json dans ce répertoire
  }

  void chargerVins() async {
    final file = await getLocalFile();

    if (await file.exists()) {
      final contents = await file.readAsString();
      final decoded = json.decode(contents) as List;
      setState(() {
        vins = decoded.map((e) => Vin.fromJson(e)).toList();
      });
    } else {
      // Fichier inexistant : on le crée avec des données de départ
      final defaultVins = [
        Vin(
          id: 0,
          nom: "Abcd",
          domaine: "Efgh",
          annee: 2015,
          couleur: "Rouge",
          quantite: 6,
        ),
      ];
      setState(() => vins = defaultVins);
      sauvegarderVins(); // Enregistrer immédiatement les données par défaut
    }
  }

  void sauvegarderVins() async {
    final file = await getLocalFile();
    final data = vins.map((v) => v.toJson()).toList();
    await file.writeAsString(json.encode(data));
  }

  void modifierQuantite(int index, int nouvelleQuantite) {
    setState(() {
      vins[index].quantite = nouvelleQuantite;
      if (nouvelleQuantite == 0) {
        vins.removeAt(
          index,
        ); // Si la quantité est à 0, on supprime le vin de la liste
      }
    });
    sauvegarderVins(); // Sauvegarder les vins après modification
  }

  void initState() {
    super.initState();
    chargerVins();
  }

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
      body: Column(
        children: [
          ToggleButtons(
            isSelected: isSelected,
            color: Color(0xAAC8B77D),
            selectedColor: Color(0xFFC8B77D),
            children:
                categories
                    .map(
                      (e) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 15,
                        ),
                        child: Text(
                          e,
                          style: TextStyle(
                            color: Color(0xFF7B1E3A),
                            fontSize: 32,
                          ),
                        ),
                      ),
                    )
                    .toList(),
            onPressed: (index) {
              setState(() {
                isSelected = List.generate(
                  categories.length,
                  (i) => i == index,
                );
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: vins.length,
              itemBuilder: (context, index) {
                final vin = vins[index];
                return WineCard(
                  vin: vin,
                  onQuantityChanged: (nouvelleQuantite) {
                    modifierQuantite(
                      index,
                      nouvelleQuantite,
                    ); // Modifier la quantité et sauvegarder
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF7B1E3A),
        child: Icon(Icons.add, color: Color(0xFFF5F0E6), size: 30),
        onPressed: () async {
          await Navigator.pushNamed(context, '/ajout');
          chargerVins(); // Recharge les vins au retour
        },
      ),
    );
  }
}
