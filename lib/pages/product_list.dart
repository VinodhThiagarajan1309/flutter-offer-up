import 'package:flutter/material.dart';
import 'package:flutter_course/pages/product_edit.dart';
import 'package:flutter_course/models/product.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_course/scopedmodels/master_scope.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MasterScope>(
        builder: (BuildContext context, Widget child, MasterScope model) {
      List<Product> products = model.products;
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              key: Key(products[index].title),
              secondaryBackground: Container(
                color: Colors.red,
              ),
              background: Container(
                color: Colors.green,
              ),
              onDismissed: (DismissDirection dismissDirection) {
                if (dismissDirection == DismissDirection.endToStart) {
                  model.setProduct(index);
                  model.deleteProduct();
                }
                /*else {
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
                    backgroundImage: AssetImage(products[index].imageUrl),
                  ),
                  title: Text(products[index].title),
                  subtitle: Text("\$" + products[index].price.toString()),
                  trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        model.setProduct(index);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ProductEditPage()));
                      }),
                ),
                Divider()
              ]));
        },
        itemCount: products.length,
      );
    });
  }
}
