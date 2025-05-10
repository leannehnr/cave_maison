import 'package:flutter/material.dart';

class Vin {
  final int id;
  final String nom;
  final String domaine;
  final int annee;
  final String couleur;
  final int quantite;

  Vin({
    required this.id,
    required this.nom,
    required this.domaine,
    required this.annee,
    required this.couleur,
    required this.quantite,
  });

  Vin copyWith({
    int? id,
    String? nom,
    String? domaine,
    int? annee,
    String? couleur,
    int? quantite,
  }) {
    return Vin(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      domaine: domaine ?? this.domaine,
      annee: annee ?? this.annee,
      couleur: couleur ?? this.couleur,
      quantite: quantite ?? this.quantite,
    );
  }

  factory Vin.fromJson(Map<String, dynamic> json) {
    return Vin(
      id: json['id'],
      nom: json['nom'],
      domaine: json['domaine'],
      annee: json['année'],
      couleur: json['couleur'],
      quantite: json['quantité'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'domaine': domaine,
      'année': annee,
      'couleur': couleur,
      'quantité': quantite,
    };
  }
}

class WineCard extends StatelessWidget {
  final Vin vin;
  final ValueChanged<int> onQuantityChanged;

  WineCard({Key? key, required this.vin, required this.onQuantityChanged})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0x66C8B77D),
      child: ListTile(
        leading: Container(width: 40, height: 60, color: Colors.white),
        title: Text(vin.nom, style: TextStyle(fontSize: 28)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(vin.couleur),
            Row(
              children: [
                Text('${vin.annee}'),
                Spacer(),
                QuantityCounter(
                  initialValue: vin.quantite,
                  onChanged: onQuantityChanged,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuantityCounter extends StatefulWidget {
  final int initialValue;
  final ValueChanged<int> onChanged;

  QuantityCounter({this.initialValue = 0, required this.onChanged});

  @override
  _QuantityCounterState createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialValue;
  }

  void _increment() {
    setState(() {
      quantity++;
      widget.onChanged(quantity);
    });
  }

  void _decrement() {
    setState(() {
      if (quantity > 0) quantity--;
      widget.onChanged(quantity);
    });
  }

  void didUpdateWidget(covariant QuantityCounter oldWidget) {
  super.didUpdateWidget(oldWidget);
  if (oldWidget.initialValue != widget.initialValue) {
    setState(() {
      quantity = widget.initialValue;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: _decrement,
          color: Color(0xFF7B1E3A),
        ),
        Text('$quantity', style: TextStyle(fontSize: 18)),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: _increment,
          color: Color(0xFF7B1E3A),
        ),
      ],
    );
  }
}
