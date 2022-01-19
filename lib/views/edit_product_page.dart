// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bs_flutter_selectbox/bs_flutter_selectbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jajanku_manager/constants/ColorConstant.dart';
import 'package:jajanku_manager/constants/HTTPConstant.dart';
import 'package:jajanku_manager/contracts/AddProductViewContract.dart';
import 'package:jajanku_manager/contracts/EditProductViewContract.dart';
import 'package:jajanku_manager/models/Product.dart';
import 'package:jajanku_manager/presenters/AddProductPresenter.dart';
import 'package:jajanku_manager/presenters/EditProductPresenter.dart';
import 'package:jajanku_manager/presenters/NavigationPresenter.dart';
import 'package:jajanku_manager/widgets/alert.dart';
import 'package:jajanku_manager/widgets/form_text_field.dart';
import 'package:jajanku_manager/widgets/select_box.dart';
import 'package:jajanku_manager/widgets/simple_button.dart';
import 'package:http/http.dart' as http;

class EditProductPage extends StatelessWidget
    implements EditProductViewContract {
  EditProductPage({required this.id, Key? key}) : super(key: key) {
    _editProductPresenter.editProductViewContract = this;
    _editProductPresenter.findProduct(id);
  }

  String id;

  final _formKey = GlobalKey<FormState>();
  final _editProductPresenter = Get.put(EditProductPresenter());
  final _navigationPresenter = Get.find<NavigationPresenter>();

  final _namaProduk = TextEditingController();
  final _hargaProduk = TextEditingController();
  final _deskripsiProduk = TextEditingController();
  final _gambarProduk = TextEditingController();
  final _kategoriProduk = BsSelectBoxController();
  File? _gambar;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "Edit Produk",
                  style: GoogleFonts.roboto(
                    color: DARK,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                FormTextField(
                  controller: _namaProduk,
                  label: "Nama Produk",
                  validator: (value) {
                    return null;
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: FormTextField(
                        controller: _hargaProduk,
                        label: "Harga Produk",
                        validator: (value) {
                          return null;
                        },
                        isNumber: true,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: SelectBox(
                        label: "Pilih kategori",
                        controller: _kategoriProduk,
                        serverSide: _fetchCategories,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                FormTextField(
                  maxLine: 3,
                  controller: _deskripsiProduk,
                  label: "Deskripsi Produk",
                  validator: (value) {
                    return null;
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: FormTextField(
                        controller: _gambarProduk,
                        isEnabled: false,
                        label: "Gambar",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: PRIMARY,
                      ),
                      onPressed: () async {
                        ImagePicker _picker = ImagePicker();
                        final XFile? image = await _picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        _gambarProduk.text = image!.name;
                        _gambar = File(image.path);
                      },
                      child: Text(
                        "Pilih",
                        style: GoogleFonts.roboto(
                          color: DARK,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: SimpleButton(
                        label: "Submit",
                        color: GREEN,
                        onPressed: () {
                          String productName = _namaProduk.text;
                          String productPrice = _hargaProduk.text;
                          String productDescription = _deskripsiProduk.text;
                          String category =
                              _kategoriProduk.getSelected()!.getValueAsString();
                          _editProductPresenter.editProduct(
                              id,
                              productName,
                              productPrice,
                              productDescription,
                              category,
                              _gambar?.path);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: SimpleButton(
                        label: "Reset",
                        color: RED,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<BsSelectBoxResponse> _fetchCategories(
      Map<String, String> params) async {
    var response = await http.get(
      Uri.parse(API_URL + '/category'),
      headers: {
        "params": jsonEncode(params),
      },
    );
    if (response.statusCode == 200) {
      List json = jsonDecode(response.body);
      return BsSelectBoxResponse.createFromJson(
        json
            .map((e) => {
                  "value": e["category_id"],
                  "text": e["category_name"],
                })
            .toList(),
      );
    }

    return BsSelectBoxResponse(options: []);
  }

  @override
  void onFetchProductFailed(String message) {
    // TODO: implement onFetchProductFailed
    // Get.dialog(InformationAlert(
    //   textContent: message,
    //   title: "Ambil Data",
    // ).danger);
  }

  @override
  void onFetchProductStart() {
    // TODO: implement onFetchProductStart
  }

  @override
  void onFetchProductSuccess(Product product) {
    // TODO: implement onFetchProductSuccess
    _namaProduk.text = product.productName ?? "";
    _hargaProduk.text = product.productPrice ?? "";
    _deskripsiProduk.text = product.productDescription ?? "";
    _kategoriProduk.setSelected(
      BsSelectBoxOption(
        value: product.category!.categoryId,
        text: Text(product.category!.categoryName ?? ""),
      ),
    );
    _gambarProduk.text = product.productImage ?? "";
  }

  @override
  void onEditProductFailed(String message) {
    // TODO: implement onEditProductFailed
    Get.dialog(InformationAlert(
      textContent: message,
      title: "Edit Data",
    ).danger);
  }

  @override
  void onEditProductStart() {
    // TODO: implement onEditProductStart
  }

  @override
  void onEditProductSuccess(String message) {
    // TODO: implement onEditProductSuccess
    Get.dialog(InformationAlert(
      textContent: message,
      title: "Edit Data",
    ).success);
    _navigationPresenter.changeIndex = 1;
  }
}
