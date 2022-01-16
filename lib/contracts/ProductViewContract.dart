import 'package:jajanku_manager/models/Product.dart';

abstract class ProductViewContract {
  void onFetchStart();
  void onFetchSuccess(List<Product> products);
  void onFetchFailed(String message);
  void onFetchError(String message);
}
