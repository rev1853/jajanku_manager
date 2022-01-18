import 'package:jajanku_manager/models/Product.dart';

abstract class EditProductViewContract {
  void onFetchProductStart();
  void onFetchProductSuccess(Product product);
  void onFetchProductFailed(String message);
  void onEditProductStart();
  void onEditProductSuccess(String message);
  void onEditProductFailed(String message);
}
