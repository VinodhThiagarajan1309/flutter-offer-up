import 'package:flutter/material.dart';
import 'package:flutter_course/models/product.dart';
import 'package:flutter_course/scopedmodels/master_scope.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductEditPage extends StatefulWidget {
  @override
  State createState() {
    return _ProductEditPage();
  }
}

class _ProductEditPage extends State<ProductEditPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {
    "title": null,
    "description": null,
    "price": null,
    "imageUrl": "assets/food.jpg"
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MasterScope>(
        builder: (BuildContext context, Widget child, MasterScope model) {
          print('This is happening 1');
          Product product = model.selectedProduct;
          if(null != product) {
            print('This is happening 2');
          }
          final Widget pageContent = GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      initialValue:
                      null == product ? "" : product.title,
                      validator: (String value) {
                        if (value.isEmpty || value.length < 5) {
                          return 'Title is required and should 5+ characters long.';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Product Title",
                      ),
                      onSaved: (String value) {
                        _formData["title"] = value;
                      },

                    ),
                    TextFormField(
                      initialValue:
                      null == product ? "" : product.description,
                      validator: (String value) {
                        if (value.isEmpty || value.length < 10) {
                          return 'Description is required and should 10+ characters long.';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Description",
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 2,
                      onSaved: (String value) {
                        _formData["description"] = value;
                      },
                    ),
                    TextFormField(
                      initialValue: null == product ? "" : product.price.toString(),
                      validator: (String value) {
                        if (value.isEmpty ||
                            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
                          return 'Price is required and must be a valid number.';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Price",
                      ),
                      keyboardType: TextInputType.numberWithOptions(
                          signed: false, decimal: true),
                      onSaved: (String value) {
                        _formData["price"] = double.parse(value);
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ScopedModelDescendant<MasterScope>(builder:
                        (BuildContext context, Widget child, MasterScope model) {
                      return RaisedButton(
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: Text("Save"),
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return; // Do nothing
                          }
                          _formKey.currentState.save();
                          //final Product product = _formData;

                          null == model.selectedProductIndex
                              ? model.addProduct(Product(
                              title: _formData["title"],
                              description: _formData["description"],
                              imageUrl: _formData["imageUrl"],
                              price: _formData["price"]))
                              : model.updateProduct(
                              Product(
                                  title: _formData["title"],
                                  description: _formData["description"],
                                  imageUrl: _formData["imageUrl"],
                                  price: _formData["price"]));

                          Navigator.pushReplacementNamed(context, "/products");
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
          );
      return null == model.selectedProductIndex
          ? pageContent
          : Scaffold(
              appBar: AppBar(
                title: Text("Edit Product"),
              ),
              body: pageContent,
            );
    });
  }
}
