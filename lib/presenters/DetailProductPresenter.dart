import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:jajanku_manager/contracts/DetailProductViewContract.dart';
import 'package:jajanku_manager/services/ProductServices.dart';

class DetailProductPresenter extends GetxController {
  late DetailProductViewContract _detailProductViewContract;
  final ProductService _productService = ProductService();

  void loadProduct(String id) {
    _productService
        .findProduct(id)
        .then(
          (value) => _detailProductViewContract.onFetchProductSuccess(value),
        )
        .catchError(
          (message) => _detailProductViewContract
              .onFetchProductFailed(message.toString()),
        );
  }
}
