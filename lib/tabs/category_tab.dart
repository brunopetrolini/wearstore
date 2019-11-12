import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/tiles/category_tile.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("products").getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var dividedTiles = ListTile.divideTiles(
                  context: context,
                  tiles: snapshot.data.documents.map((document) {
                    return CategoryTile(document);
                  }).toList(),
                  color: Colors.grey[500])
              .toList();

          return ListView(children: dividedTiles);
        }
      },
    );
  }
}
