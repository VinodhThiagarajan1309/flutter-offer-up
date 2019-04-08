import 'package:flutter/material.dart';
import 'package:flutter_course/widgets/product/products.dart';
import 'package:flutter_course/models/product.dart';
import 'package:flutter_course/scopedmodels/master_scope.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductsPage extends StatelessWidget {
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
          ScopedModelDescendant<MasterScope>(builder:
              (BuildContext context, Widget child, MasterScope model) {

            Color favCol = Colors.white;

            print('Wait What ' + model.getFavTogStatus.toString());
            if(model.getFavTogStatus) {
              favCol =   Colors.red;

            }

            return IconButton(
              icon: Icon(model.getFavTogStatus
                  ? Icons.favorite
                  : Icons.favorite_border),
              color: favCol,
              onPressed: () {
                model.toggleDisplayMode();
              },
            );
          })
        ],
        title: Text("Easy List"),
      ),
      body: Products(),
    );
  }
}
