import 'package:flutter/material.dart';

import 'package:flutter_course/products.dart';
import 'package:flutter_course/product_control.dart';

class ProductManager extends StatelessWidget {

  final List<Map<String,String>> products;
  final Function addProducts;
  final Function deleteProduct;

  ProductManager(this.products,this.addProducts,this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    print('Build Called');
    return Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.all(10.0),
            child: ProductControl(addProducts)),
            Expanded(
              //height: 300.0,
              child :
        Products(products, deleteProduct : deleteProduct))
      ],
    );
  }
}
