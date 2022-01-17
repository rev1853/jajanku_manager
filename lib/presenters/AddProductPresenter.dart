import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:jajanku_manager/contracts/AddProductViewContract.dart';
import 'package:jajanku_manager/services/CategoryServices.dart';
import 'package:jajanku_manager/services/ProductServices.dart';

class AddProductPresenter extends GetxController {
  late AddProductViewContract _addProductViewContract;
  final CategoryService _categoryService = CategoryService();
  final ProductService _productService = ProductService();

  set addProductViewContract(AddProductViewContract addProductViewContract) {
    _addProductViewContract = addProductViewContract;
  }

  void saveProduct(String productName, String productPrice,
      String productDescription, String category, String imagePath) {
    _productService
        .saveProduct(
            productName, productPrice, productDescription, category, imagePath)
        .then(
      (value) {
        _addProductViewContract.onProductSaveSuccess(value['message']);
        print(value['message']);
      },
    ).catchError((message) {
      _addProductViewContract.onProductSaveFailed(message.toString());
    });
  }
}
