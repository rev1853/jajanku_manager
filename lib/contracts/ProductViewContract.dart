import 'package:jajanku_manager/models/Product.dart';

abstract class ProductViewContract {
  void onFetchStart();
  void onFetchSuccess(List<Product> products);
  void onFetchError(String message);
  void onDeleteSuccess(String message);
  void onDeleteError(String message);
}
