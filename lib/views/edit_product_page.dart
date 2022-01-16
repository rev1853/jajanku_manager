// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jajanku_manager/constants/ColorConstant.dart';
import 'package:jajanku_manager/widgets/form_text_field.dart';
import 'package:jajanku_manager/widgets/login_text_field.dart';

class EditProductPage extends StatelessWidget {
  EditProductPage({required this.id, Key? key}) : super(key: key);
  String id;
  final _formKey = GlobalKey<FormState>();

  final _namaProduk = TextEditingController();
  final _hargaProduk = TextEditingController();
  final _deskripsiProduk = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(id);
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
                  "Tambah Produk",
                  style: GoogleFonts.roboto(
                    color: DARK,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FormTextField(
                  controller: _namaProduk,
                  label: "Nama Produk",
                  validator: (value) {
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                FormTextField(
                  controller: _hargaProduk,
                  label: "Harga Produk",
                  validator: (value) {
                    return null;
                  },
                  isNumber: true,
                ),
                SizedBox(
                  height: 15,
                ),
                FormTextField(
                  maxLine: 3,
                  controller: _deskripsiProduk,
                  label: "Deskripsi Produk",
                  validator: (value) {
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
