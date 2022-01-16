import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jajanku_manager/constants/ColorConstant.dart';
import 'package:jajanku_manager/presenters/NavigationPresenter.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavBarItem(Icons.home_outlined, "Beranda", 0),
          BottomNavBarItem(Icons.fastfood_outlined, "Produk", 1),
          BottomNavBarItem(Icons.article_outlined, "Pesanan", 2),
          BottomNavBarItem(Icons.settings_outlined, "Pengaturan", 3),
        ],
      ),
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  IconData _icon;
  String _text;
  int _index;

  final NavigationPresenter navigationPresenter =
      Get.find<NavigationPresenter>();

  BottomNavBarItem(this._icon, this._text, this._index);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        navigationPresenter.changeIndex = _index;
      },
      child: Obx(
        () => Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: navigationPresenter.currentIndex.value == _index
                ? PRIMARY.withAlpha(200)
                : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _icon,
                size: 30,
                color: navigationPresenter.currentIndex.value == _index
                    ? DARK
                    : DARK.withAlpha(140),
              ),
              SizedBox(
                width: 3,
              ),
              Visibility(
                visible: navigationPresenter.currentIndex.value == _index,
                child: Text(
                  _text,
                  style: TextStyle(
                    fontSize: 15,
                    color: navigationPresenter.currentIndex.value == _index
                        ? DARK
                        : DARK.withAlpha(140),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
