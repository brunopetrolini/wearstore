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

  String selectedSize;

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
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 3,
                ),
                Text(
                  "R\$ ${product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Tamanho",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 34,
                  child: GridView(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.5,
                    ),
                    children: product.sizes.map((size) {
                      return GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            border: Border.all(
                              color: size == selectedSize
                                  ? primaryColor
                                  : Colors.grey,
                              width: 3,
                            ),
                          ),
                          width: 50,
                          alignment: Alignment.center,
                          child: Text(size),
                        ),
                        onTap: () {
                          setState(() {
                            selectedSize = size;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    onPressed: selectedSize != null ? () {} : null,
                    child: Text(
                      "Adicionar ao Carrinho",
                      style: TextStyle(fontSize: 18),
                    ),
                    color: primaryColor,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Descrição",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
