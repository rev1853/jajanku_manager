import 'package:jajanku_manager/models/Category.dart';

abstract class AddProductViewContract {
  void onProductSaveSuccess(String message);
  void onProductSaveFailed(String message);
}
