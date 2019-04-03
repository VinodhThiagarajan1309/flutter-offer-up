import 'package:flutter/material.dart';
import 'package:flutter_course/pages/product_edit.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function updateProduct;
  final Function deleteProduct;

  ProductListPage(this.products, this.updateProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
            key: Key(products[index]["title"]),
            secondaryBackground: Container(
              color: Colors.red,
            ),
            background: Container(
              color: Colors.green,
            ),
            onDismissed: (DismissDirection dismissDirection) {
              if (dismissDirection == DismissDirection.endToStart) {
                deleteProduct(index);
              } /*else {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ProductEditPage(
                      productIndex: index,
                      product: products[index],
                      updateProduct: updateProduct,
                    )));
              }*/
            },
            child: Column(children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(products[index]["imageUrl"]),
                ),
                title: Text(products[index]["title"]),
                subtitle: Text("\$" + products[index]["price"].toString()),
                trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => ProductEditPage(
                                productIndex: index,
                                product: products[index],
                                updateProduct: updateProduct,
                              )));
                    }),
              ),
              Divider()
            ]));
      },
      itemCount: products.length,
    );
  }
}
