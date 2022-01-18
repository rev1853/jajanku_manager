import 'package:jajanku_manager/models/Product.dart';

abstract class DetailProductViewContract {
  void onFetchProductStart();
  void onFetchProductSuccess(Product product);
  void onFetchProductFailed(String message);
}
