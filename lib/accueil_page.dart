import 'package:flutter/material.dart';
import 'wine_card.dart';

class AccueilPage extends StatefulWidget {
  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  final List<String> categories = ['Rouge', 'Blanc', 'Rosé', 'Bulles'];
  List<bool> isSelected = [true, false, false, false];

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
              itemCount: 5,
              itemBuilder: (context, index) => WineCard(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF7B1E3A),
        child: Icon(Icons.add, color: Color(0xFFF5F0E6), size: 30),
        onPressed: () {
          Navigator.pushNamed(context, '/ajout');
        },
      ),
    );
  }
}
