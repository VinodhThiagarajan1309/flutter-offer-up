import 'package:flutter/material.dart';
import 'package:async/async.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

  _showWarningDialog(BuildContext context) {
    showDialog(context : context,builder: (BuildContext context) {

      return AlertDialog(title: Text("Are you sure ?"), content: Text(" This action cannot be undone"), actions: <Widget>[
        FlatButton(child: Text("Discard"),onPressed: () {
          Navigator.pop(context);
        },),
        FlatButton(child: Text("Continue"), onPressed: () {
          Navigator.pop(context);
          Navigator.pop(context, true);
        },)
      ],);

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
          title: Text(title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageUrl),
            Container(
              child: Text(title),
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