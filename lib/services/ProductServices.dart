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

  Future<String> saveProduct(String productName, String productPrice,
      String productDescription, String category, List<int> imagePath) async {
    String image = base64Encode(imagePath);
    print(image);

    Map<String, String> data = {
      'product_name': productName,
      'product_price': productPrice,
      'product_description': productDescription,
      'category_id': category,
    };
    // var url = Uri.http(BASE_URL + "/add", "", data);
    // var response = await http.get(url, headers: {
    //   HttpHeaders.contentTypeHeader: "application/json",
    // });
    var url = Uri.parse(BASE_URL + "/add");
    var response = await http.post(
      url,
      body: jsonEncode(data),
    );
    print(jsonEncode(data));
    return response.body;
  }
}
