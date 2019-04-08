import 'package:flutter/material.dart';
import 'price.dart';
import 'package:flutter_course/widgets/ui_elements/title_default.dart';
import 'package:flutter_course/widgets/ui_elements/address.dart';
import 'package:flutter_course/models/product.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_course/scopedmodels/master_scope.dart';

class CustomCard extends StatelessWidget {
  final Product product;
  final int index;

  CustomCard(this.index, this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product.imageUrl),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TitleDefault(product.title),
                      SizedBox(
                        width: 8.0,
                      ),
                      PriceTag(product.price.toString()),
                    ]),
                padding: EdgeInsets.only(top: 10.0),
              ),
            ],
          ),
          AddressTag("Cedar Park, Texas"),

          // Text(products[index]['description']),
          // Text(products[index]['price'].toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ButtonBar(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.info),
                    color: Colors.blue,
                    //child: Text("Details"),
                    onPressed: () {
                      Navigator.pushNamed<bool>(
                          context, "/product/" + index.toString());
                    },
                  ),
                ],
              ),
              ButtonBar(
                children: <Widget>[
                  ScopedModelDescendant<MasterScope>(builder:
                      (BuildContext context, Widget child,
                          MasterScope model) {
                    return IconButton(
                      icon: Icon(model.products[index].isFavourite
                          ? Icons.favorite
                          : Icons.favorite_border),
                      color: Colors.red,
                      //child: Text("Details"),
                      onPressed: () {
                        model.setProduct(index);
                        model.toggleProductFav();
                      },
                    );
                  })
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
