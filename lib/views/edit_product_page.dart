// ignore_for_file: prefer_const_constructors

import 'package:bs_flutter_selectbox/bs_flutter_selectbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jajanku_manager/constants/ColorConstant.dart';
import 'package:jajanku_manager/widgets/form_text_field.dart';
import 'package:jajanku_manager/widgets/login_text_field.dart';
import 'package:jajanku_manager/widgets/select_box.dart';
import 'package:jajanku_manager/widgets/simple_button.dart';

class EditProductPage extends StatelessWidget {
  EditProductPage({required this.id, Key? key}) : super(key: key);
  String id;
  final _formKey = GlobalKey<FormState>();

  final _namaProduk = TextEditingController();
  final _hargaProduk = TextEditingController();
  final _deskripsiProduk = TextEditingController();
  final _gambarProduk = TextEditingController();
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
                        controller: BsSelectBoxController(
                          options: [
                            BsSelectBoxOption(
                              value: 1,
                              text: Text("makanan"),
                            )
                          ],
                        ),
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
                      onPressed: () {},
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
                        onPressed: () {},
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
}
