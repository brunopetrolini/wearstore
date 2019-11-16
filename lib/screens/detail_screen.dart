import 'package:flutter/material.dart';
import 'package:lojavirtual/data/product_data.dart';
import 'package:carousel_pro/carousel_pro.dart';

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
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.9,
            child: Carousel(
              images: product.images.map((url) {
                return NetworkImage(url);
              }).toList(),
              dotSize: 6,
              dotSpacing: 20,
              dotBgColor: Colors.transparent,
              dotColor: primaryColor,
              dotIncreasedColor: primaryColor,
              autoplay: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  product.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 3,
                ),
                Text(
                  "R\$ ${product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
