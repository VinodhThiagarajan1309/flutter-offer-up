import 'package:flutter/material.dart';
import 'package:flutter_course/widgets/ui_elements/title_default.dart';

class ProductPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductPage(this.product);

  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Are you sure ?"),
            content: Text(" This action cannot be undone"),
            actions: <Widget>[
              FlatButton(
                child: Text("Discard"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Continue"),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back Button Pressed.');
        Navigator.pop(context, false);
        Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(product["title"]),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(product["imageUrl"]),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TitleDefault(product['title']),
                  ),
                  Text(
                    "\$" + product["price"].toString(),
                    style: TextStyle(
                        fontFamily: "Oswald",
                        color: Colors.green,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              padding: EdgeInsets.all(10.0),
            ),
            Container(
              child: Text(
                product["description"],
                textDirection: TextDirection.ltr,
              ),
              padding: EdgeInsets.all(10.0),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text("Delete"),
                onPressed: () {
                  _showWarningDialog(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
