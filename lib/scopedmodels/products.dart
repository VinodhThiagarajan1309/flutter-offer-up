import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_course/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

mixin ProductsModel on Model {
  List<Product> _products = [];

  int _selectedProductIndex;

  bool _showFavs = false;

  List<Product> get products {
    if(_showFavs) {
      return favOnlyProducts;
    }
    return List.from(_products);
  }

  List<Product> get favOnlyProducts {
    List<Product> favOnlyList = [];
    for(int i=0; i < _products.length; i++) {
      if(_products[i].isFavourite) {
        favOnlyList.add(_products[i]);
      }
    }
    return favOnlyList;
  }

  int get selectedProductIndex {
    return _selectedProductIndex;
  }

  void updateProduct(Product product) {
    _products[_selectedProductIndex] = product;
    _selectedProductIndex = null;
    notifyListeners();
  }

  void addProduct(Product product) {
    final Map<String,dynamic> productData = {
      "title" : product.title,
      "description" : product.description,
      "price" : product.price,
      "imageUrl" : product.imageUrl

    };

    print('Interesting Didnt Work');

    http.post("https://vin-offer-up.firebaseio.com/products.json",
    body: json.encode(productData));

    print('Interesting Didnt Work');

    _products.add(product);
    _selectedProductIndex = null;
    notifyListeners();
  }

  void toggleProductFav() {
    final bool currentStatus = _products[selectedProductIndex].isFavourite;
    final bool newStatus = !currentStatus;
    final Product updatedProduct = Product(
        title: selectedProduct.title,
        description: selectedProduct.description,
        price: selectedProduct.price,
        imageUrl: selectedProduct.imageUrl,
        isFavourite: newStatus);
    _products[selectedProductIndex] = updatedProduct;
    _selectedProductIndex = null;
    notifyListeners();
  }

  Product get selectedProduct {
    if (null == _selectedProductIndex) {
      return null;
    }
    return products[_selectedProductIndex];
  }

  void deleteProduct() {
    _products.removeAt(_selectedProductIndex);
    _selectedProductIndex = null;
  }

  void setProduct(int index) {
    _selectedProductIndex = index;
  }

  void toggleDisplayMode() {
    print('This was called too');
    _showFavs = !_showFavs;
    notifyListeners();
    _selectedProductIndex = null;
  }

  bool get getFavTogStatus {
    return _showFavs;

  }
}
