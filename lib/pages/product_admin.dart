import 'package:flutter/material.dart';
import 'package:flutter_course/pages/products.dart';
import 'package:flutter_course/pages/product_edit.dart';
import 'package:flutter_course/pages/product_list.dart';

class ProductAdmin extends StatelessWidget {

  final List<Map<String,dynamic>> products;
  final Function addProduct;
  final Function deleteProduct;
  final Function updateProduct;

  ProductAdmin(this.addProduct,this.deleteProduct,this.updateProduct,this.products);


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text("Choose"),
              ),
              ListTile(
                leading: Icon(Icons.shop),
                title: Text("List Products"),
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,"/products"
                  );
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Create Product"),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.create),
              text: "Create Product",
            ),
            Tab(
              icon: Icon(Icons.list),
              text: "My Products",
            )
          ]),
        ),
        body: TabBarView(
            children: <Widget>[ProductEditPage(addProduct: addProduct), ProductListPage(products,updateProduct,deleteProduct)]),
      ),
    );
  }
}
