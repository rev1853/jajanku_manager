import 'package:jajanku_manager/models/Category.dart';

class Product {
  String? productId;
  String? productName;
  String? productPrice;
  String? productImage;
  String? productDescription;
  Category? category;

  Product(
      {this.productId,
      this.productName,
      this.productPrice,
      this.productImage,
      this.productDescription,
      this.category});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productImage = json['product_image'];
    productDescription = json['product_description'];
    category = json['product_category'] != null
        ? Category.fromJson(json['product_category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_price'] = productPrice;
    data['product_image'] = productImage;
    data['product_description'] = productDescription;
    if (category != null) {
      data['product_category'] = category!.toJson();
    }
    return data;
  }
}
