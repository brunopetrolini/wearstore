import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final String orderID;

  OrderTile(this.orderID);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: StreamBuilder<DocumentSnapshot>(
          stream: Firestore.instance
              .collection("orders")
              .document(orderID)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              int status = snapshot.data["status"];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Código do pedido: ${snapshot.data.documentID}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    _buildProductText(snapshot.data),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Status do pedido:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildCircle("1", "Preparação", status, 1),
                      Container(height: 1, width: 40, color: Colors.grey[500]),
                      _buildCircle("2", "Transporte", status, 2),
                      Container(height: 1, width: 40, color: Colors.grey[500]),
                      _buildCircle("3", "Entrega", status, 3),
                    ],
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }

  String _buildProductText(DocumentSnapshot snapshot) {
    String text = "Descrição\n";

    for (LinkedHashMap product in snapshot.data["products"]) {
      text +=
          "${product["quantity"]} x ${product["product"]["title"]} (R\$ ${product["product"]["price"].toStringAsFixed(2)})\n";
    }

    text += "Total: R\$ ${snapshot.data["totalPrice"].toStringAsFixed(2)}";

    return text;
  }

  Widget _buildCircle(
      String title, String subtitle, int status, int thisStatus) {
    Color bgColor;
    Widget child;

    if (status < thisStatus) {
      bgColor = Colors.grey[500];
      child = Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      );
    } else if (status == thisStatus) {
      bgColor = Colors.blue;
      child = Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.white,
            ),
          )
        ],
      );
    } else {
      bgColor = Colors.green;
      child = Icon(
        Icons.check,
        color: Colors.white,
      );
    }

    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 20,
          backgroundColor: bgColor,
          child: child,
        ),
        Text(subtitle)
      ],
    );
  }
}
