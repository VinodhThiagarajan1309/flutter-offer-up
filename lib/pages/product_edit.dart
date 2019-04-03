import 'package:flutter/material.dart';

class ProductEditPage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final int productIndex;
  final Map<String,dynamic> product;

  ProductEditPage({this.addProduct,this.product,this.updateProduct,this.productIndex});

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
    "imageUrl" : "assets/food.jpg"
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final Widget pageContent =
     GestureDetector(
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
                initialValue: null == widget.product ? "" : widget.product["title"],
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
                /* onChanged: (String value) {
              setState(() {
                _titleValue = value;
              });
            },*/
              ),
              TextFormField(
                initialValue: null == widget.product ? "" : widget.product["description"],
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
                initialValue: null == widget.product ? "" : widget.product["price"].toString(),
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
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text("Save"),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return; // Do nothing
                  }
                  _formKey.currentState.save();
                  //final Map<String, dynamic> product = _formData;

                  null == widget.product ? widget.addProduct(_formData) : widget.updateProduct(widget.productIndex,_formData);

                  Navigator.pushReplacementNamed(context, "/products");
                },
              )
            ],
          ),
        ),
      ),
    );

    return null == widget.product ? pageContent : Scaffold(appBar: AppBar(title: Text("Edit Product"),), body: pageContent,);
  }
}
