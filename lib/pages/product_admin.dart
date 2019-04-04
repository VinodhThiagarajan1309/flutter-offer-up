import 'package:flutter/material.dart';
import 'package:flutter_course/pages/products.dart';
import 'package:flutter_course/pages/product_edit.dart';
import 'package:flutter_course/pages/product_list.dart';
import 'package:flutter_course/models/product.dart';

class ProductAdmin extends StatelessWidget {

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
            children: <Widget>[ProductEditPage(), ProductListPage()]),
      ),
    );
  }
}
