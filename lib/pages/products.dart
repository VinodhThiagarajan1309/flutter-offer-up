import 'package:flutter/material.dart';
import 'package:flutter_course/widgets/product/products.dart';

class ProductsPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  ProductsPage(this.products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text("Choose"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Manage Products"),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  "/admin",
                );
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          )
        ],
        title: Text("Easy List"),
      ),
      body: Products(products),
    );
  }
}
