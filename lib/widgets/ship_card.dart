import 'package:flutter/material.dart';

class ShippingCard extends StatelessWidget {
  const ShippingCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ExpansionTile(
        title: Text(
          "Calcular Frete",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(Icons.keyboard_arrow_down),
        leading: Icon(Icons.location_on),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Digite seu CEP",
              ),
              initialValue: "",
            ),
          ),
        ],
      ),
    );
  }
}
