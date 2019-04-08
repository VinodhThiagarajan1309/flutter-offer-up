import 'package:flutter/material.dart';
import 'package:flutter_course/pages/auth.dart';
import 'package:flutter_course/pages/product_admin.dart';
import 'package:flutter_course/pages/products.dart';
import 'package:flutter_course/pages/product.dart';
import 'package:flutter/rendering.dart';
import 'models/product.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_course/scopedmodels/master_scope.dart';
import 'package:flutter_course/scopedmodels/master_scope.dart';


void main() {
  //debugPaintSizeEnabled = true;
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MasterScope>(
        model: MasterScope(),
        child: MaterialApp(
      //debugShowMaterialGrid: true,
      //home: AuthPage(),
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          accentColor: Colors.amberAccent),
      routes: {
        "/": (BuildContext context) => AuthPage(),
        "/products": (BuildContext context) => ProductsPage(),
        "/admin": (BuildContext context) =>
            ProductAdmin()
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split("/");

        if (pathElements[0] != "") {
          return null;
        }
        if (pathElements[1] == "product") {
          final int index = int.parse(pathElements[2]);

          print('This is the index' + index.toString());

          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(index),
          );
        }

        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => ProductsPage());
      },
    ));
  }
}
