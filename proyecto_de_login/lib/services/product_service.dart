import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:proyecto_de_login/models/product.dart';
import 'package:http/http.dart' as http;

class ProductServices extends ChangeNotifier {
  final String _baseURL = 'flutter-varios-90427-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  bool isLoading = true;

  ProductServices() {
    this.loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    this.isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseURL, 'products.json');
    final resp = await http.get(url);
    final Map<String, dynamic> productsMap = json.decode(resp.body);
    // ignore: avoid_print
    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      this.products.add(tempProduct);
      print(this.products[0].name);
    });
    this.isLoading = false;
    notifyListeners();
    return this.products;
  }
}
