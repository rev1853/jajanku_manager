import 'package:get/get.dart';
import 'package:jajanku_manager/contracts/EditProductViewContract.dart';
import 'package:jajanku_manager/contracts/ProductViewContract.dart';
import 'package:jajanku_manager/services/ProductServices.dart';

class EditProductPresenter extends GetxController {
  final ProductService _productService = ProductService();
  late EditProductViewContract _editProductViewContract;

  set editProductViewContract(EditProductViewContract editProductViewContract) {
    _editProductViewContract = editProductViewContract;
  }

  void editProduct(String id, String? productName, String? productPrice,
      String? productDescription, String? category, String? imagePath) {
    _editProductViewContract.onEditProductStart();
    _productService
        .editProduct(id, productName, productPrice, productDescription,
            category, imagePath)
        .then(
          (value) =>
              _editProductViewContract.onEditProductSuccess(value["message"]),
        )
        .catchError(
      (message) {
        _editProductViewContract.onEditProductFailed(message.toString());
      },
    );
  }

  void findProduct(String id) {
    _editProductViewContract.onFetchProductStart();
    _productService
        .findProduct(id)
        .then(
          (value) => _editProductViewContract.onFetchProductSuccess(value),
        )
        .catchError((message) {
      _editProductViewContract.onFetchProductFailed(message.toString());
    });
  }
}
