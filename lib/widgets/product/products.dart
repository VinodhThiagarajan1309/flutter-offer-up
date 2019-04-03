import 'package:flutter/material.dart';
import 'package:flutter_course/widgets/product/custom_card.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products);

  Widget _buildProductList() {
    Widget productCards;

    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return CustomCard(index, products[index]);
        },
        itemCount: products.length,
      );
    } else {
      productCards = Container(
          child: Center(
        child: Text("No Products found. Add some !"),
      ));
    }

    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
