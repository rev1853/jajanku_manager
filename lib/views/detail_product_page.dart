import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jajanku_manager/contracts/DetailProductViewContract.dart';
import 'package:jajanku_manager/models/Product.dart';
import 'package:jajanku_manager/widgets/alert.dart';

class DetailProductPage extends StatelessWidget
    implements DetailProductViewContract {
  DetailProductPage({required this.id, Key? key}) : super(key: key);
  String id;
  Rx<Product>? _product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [],
        ),
      ),
    );
  }

  @override
  void onFetchProductFailed(String message) {
    // TODO: implement onFetchProductFailed
    Get.dialog(InformationAlert(
      textContent: message,
      title: "Ambil Data",
    ).danger);
  }

  @override
  void onFetchProductStart() {
    // TODO: implement onFetchProductStart
  }

  @override
  void onFetchProductSuccess(Product product) {
    // TODO: implement onFetchProductSuccess
    _product!.value = product;
  }
}
