// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jajanku_manager/constants/ColorConstant.dart';
import 'package:jajanku_manager/contracts/ProductViewContract.dart';
import 'package:jajanku_manager/models/Product.dart';
import 'package:jajanku_manager/presenters/NavigationPresenter.dart';
import 'package:jajanku_manager/presenters/ProductPresenter.dart';
import 'package:jajanku_manager/widgets/slidable_listview_item.dart';

class ProductPage extends StatelessWidget implements ProductViewContract {
  ProductPage({Key? key}) : super(key: key) {
    productPresenter.productViewContract = this;
    productPresenter.loadProduct();
  }

  final productPresenter = Get.find<ProductPresenter>();
  final navigationPresenter = Get.find<NavigationPresenter>();
  RxList<Product> products = RxList<Product>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Obx(
          () => Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.list_alt_outlined,
                          size: 25,
                          color: DARK,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Data Produk",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: DARK,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Tambah Baru",
                            style: GoogleFonts.roboto(),
                          ),
                          style: TextButton.styleFrom(
                            primary: GREEN,
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
                itemCount: products.value.length,
                itemBuilder: (_, index) {
                  Product product = products.value[index];
                  return SlidableItem(
                    title: product.productName ?? "Tanpa nama",
                    subtitle:
                        product.category!.categoryName ?? "Tanpa Kategori",
                    price: product.productPrice ?? "0",
                    index: index,
                    image: product.productImage ?? "",
                    onDelete: (BuildContext context) {},
                    onDetail: (BuildContext context) {},
                    onEdit: (BuildContext context) {
                      navigationPresenter.withData = {"id": product.productId};
                      navigationPresenter.changeIndex = 4;
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onFetchError(String message) {
    // TODO: implement onFetchError
    print(message);
  }

  @override
  void onFetchFailed(String message) {
    // TODO: implement onFetchFailed
    print(message);
  }

  @override
  void onFetchStart() {
    // TODO: implement onFetchStart
  }

  @override
  void onFetchSuccess(List<Product> products) {
    // TODO: implement onFetchSuccess
    this.products.value = products;
  }
}
