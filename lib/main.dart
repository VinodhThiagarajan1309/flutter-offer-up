import 'package:flutter/material.dart';
import 'package:flutter_course/pages/auth.dart';
import 'package:flutter_course/pages/product_admin.dart';
import 'package:flutter_course/pages/products.dart';
import 'package:flutter_course/pages/product.dart';
import 'package:flutter/rendering.dart';

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
  final List<Map<String, dynamic>> _products = [];

  void _updateProduct(int positionOfTheProduct, Map<String, dynamic> product) {
    setState(() {
      _products[positionOfTheProduct] = product;
    });
  }

  void _addProducts(Map<String, dynamic> product) {
    setState(() {
      print('This was called ');
      _products.add(product);
    });
  }

  void _deleteProduct(int positionOfTheProduct) {
    setState(() {
      _products.removeAt(positionOfTheProduct);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowMaterialGrid: true,
      //home: AuthPage(),
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          accentColor: Colors.amberAccent),
      routes: {
        "/": (BuildContext context) => AuthPage(),
        "/products": (BuildContext context) => ProductsPage(_products),
        "/admin": (BuildContext context) =>
            ProductAdmin(_addProducts, _deleteProduct,_updateProduct,_products)
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split("/");

        if (pathElements[0] != "") {
          return null;
        }
        if (pathElements[1] == "product") {
          final int index = int.parse(pathElements[2]);

          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(_products[index]),
          );
        }

        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => ProductsPage(_products));
      },
    );
  }
}
