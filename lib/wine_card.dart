import 'package:flutter/material.dart';

class WineCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0x66C8B77D),
      child: ListTile(
        leading: Container(width: 40, height: 60, color: Colors.white),
        title: Text('Caca prout', style: TextStyle(fontSize: 28)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Couleur'),
            Row(
              children: [
                Text('Année'),
                Spacer(),
                QuantityCounter(initialValue: 1, onChanged: (newValue) {}),
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
