import 'package:flutter/material.dart';
import 'wine_card.dart';

class AccueilPage extends StatelessWidget {
  final List<String> categories = ['Rouge', 'Blanc', 'Rosé', 'Bulles'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cave à vin',
          style: TextStyle(color: Color(0xFFF5F0E6)),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFF7B1E3A),
      ),
      body: Column(
        children: [
          ToggleButtons(
            isSelected: [true, false, false, false],  
            color: Color(0xAAC8B77D),
            selectedColor: Color(0xFFC8B77D),
            children:
                categories
                    .map(
                      (e) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80),
                        child: Text(
                          e,
                          style: TextStyle(color: Color(0xFF7B1E3A)),
                        ),
                      ),
                    )
                    .toList(),
            onPressed: (index) {},
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
        child: Icon(Icons.add, color: Color(0xFFF5F0E6)),
        onPressed: () {
          Navigator.pushNamed(context, '/ajout');
        },
      ),
    );
  }
}
