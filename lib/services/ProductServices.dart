import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

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

  Future<String> deleteProduk(String id) async {
    var url = Uri.parse(BASE_URL + "/delete/" + id);
    var response = await http.delete(url);

    var data = jsonDecode(response.body);

    return data["message"] ?? "";
  }

  Future<Map> saveProduct(String productName, String productPrice,
      String productDescription, String category, String imagePath) async {
    Map<String, String> data = {
      'product_name': productName,
      'product_price': productPrice,
      'product_description': productDescription,
      'category_id': category,
    };
    var url = Uri.parse(BASE_URL + "/add");

    var request = await http.MultipartRequest("POST", url)
      ..fields.addAll(data)
      ..files.add(
        await http.MultipartFile.fromPath("product_image", imagePath),
      );
    var res = await request.send();

    var response = await http.Response.fromStream(res);
    return jsonDecode(response.body);
  }
}
