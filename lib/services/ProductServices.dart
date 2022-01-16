import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:jajanku_manager/constants/HTTPConstant.dart';
import 'package:jajanku_manager/models/Product.dart';

class ProductService {
  String BASE_URL = "$API_URL/product";

  Future<List<Product>> fetchProducts() async {
    var url = Uri.parse(BASE_URL);
    var response = await http.get(url);

    List data = jsonDecode(response.body);
    List<Product> products = [];

    for (var element in data) {
      products.add(Product.fromJson(element));
    }

    return products;
  }
}
