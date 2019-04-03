import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final String price;

  PriceTag(this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(2.5),
        ),
        child: Text(
          "\$" + price,
        ));
  }
}
