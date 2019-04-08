import 'package:flutter/material.dart';
import 'package:flutter_course/widgets/product/custom_card.dart';
import 'package:flutter_course/models/product.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_course/scopedmodels/master_scope.dart';

class Products extends StatelessWidget {
  Widget _buildProductList(List<Product> products) {
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
    return ScopedModelDescendant<MasterScope>(
      builder: (BuildContext context, Widget child, MasterScope model) {
        return _buildProductList(model.products);
      },
    );
  }
}
