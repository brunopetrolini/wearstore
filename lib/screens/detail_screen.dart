import 'package:flutter/material.dart';
import 'package:lojavirtual/data/product_data.dart';

class DetailScreen extends StatefulWidget {
  final ProductData product;
  DetailScreen(this.product);

  @override
  _DetailScreenState createState() => _DetailScreenState(product);
}

class _DetailScreenState extends State<DetailScreen> {
  final ProductData product;
  _DetailScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
    );
  }
}
