import 'package:flutter/material.dart';
import 'package:flutter_course/pages/auth.dart';
import 'package:flutter_course/pages/product_admin.dart';
import 'package:flutter_course/pages/products.dart';
import 'package:flutter_course/pages/product.dart';

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

  final List<Map<String,String>> _products = [];

  void _addProducts(Map<String,String> product) {
    setState(() {
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
      routes: {
        "/": (BuildContext context) => Products(_products,_addProducts,_deleteProduct),
        "/admin": (BuildContext context) => ProductAdmin()
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split("/");

        if(pathElements[0] != "") {
          return null;
        }
        if(pathElements[1] == "product") {

          final int index =  int.parse(pathElements[2]);


          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
                _products[index]['title'],
                _products[index]['imageUrl']),
          );

        }

        return null;

      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) => Products(_products,_addProducts,_deleteProduct));
      },
    );
  }



}
