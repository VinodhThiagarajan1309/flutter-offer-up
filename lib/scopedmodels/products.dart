import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_course/models/product.dart';

class ProductsModel extends Model {
  List<Product> _products = [];

  int _selectedProductIndex;

  List<Product> get products {
    return List.from(_products);
  }

  int get selectedProductIndex {
    return _selectedProductIndex;
  }

  void updateProduct(Product product) {
    _products[_selectedProductIndex] = product;
    _selectedProductIndex = null;
  }

  void addProduct(Product product) {
    _products.add(product);
    _selectedProductIndex = null;
  }

  void _toggleProductFav() {
    final bool currentStatus = _products[selectedProductIndex].isFavourite;
    final bool newStatus = !currentStatus;
    final Product updatedProduct = Product(
        title: selectedProduct.title,
        description: selectedProduct.description,
        price: selectedProduct.price,
        imageUrl: selectedProduct.imageUrl,
        isFavourite: newStatus);
    _products[selectedProductIndex] = updatedProduct;
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
}
