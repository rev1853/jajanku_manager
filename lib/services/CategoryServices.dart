import 'dart:convert';

import 'package:jajanku_manager/constants/HTTPConstant.dart';
import 'package:jajanku_manager/models/Category.dart';
import 'package:jajanku_manager/models/Product.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  String BASE_URL = "$API_URL/category";

  Future<List<Category>> fetchCategories() async {
    var url = Uri.parse(BASE_URL);
    var response = await http.get(url);

    List data = jsonDecode(response.body);
    List<Category> products = [];

    for (var element in data) {
      products.add(Category.fromJson(element));
    }

    return products;
  }
}
