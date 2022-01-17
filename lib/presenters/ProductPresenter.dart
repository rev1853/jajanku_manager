import 'package:get/get.dart';
import 'package:jajanku_manager/contracts/ProductViewContract.dart';
import 'package:jajanku_manager/services/ProductServices.dart';

class ProductPresenter extends GetxController {
  late ProductViewContract _productViewContract;
  final ProductService _productService = ProductService();

  void loadProduct() async {
    _productViewContract.onFetchStart();
    _productService
        .fetchProducts()
        .then(
          (products) => _productViewContract.onFetchSuccess(products),
        )
        .catchError(
      (message) {
        _productViewContract.onFetchError(message.toString());
      },
    );
  }

  void deleteProduct(String id) async {
    _productService
        .deleteProduk(id)
        .then(
          (value) => _productViewContract.onDeleteSuccess(value),
        )
        .catchError(
      (message) {
        _productViewContract.onDeleteError(message.toString());
      },
    );
  }

  set productViewContract(ProductViewContract productViewContract) {
    _productViewContract = productViewContract;
  }
}
