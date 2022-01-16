import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jajanku_manager/constants/ColorConstant.dart';

class SlidableItem extends StatelessWidget {
  SlidableItem({
    Key? key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.price,
    required this.onDelete,
    required this.onEdit,
    required this.onDetail,
  }) : super(key: key);

  int index;
  String title;
  String subtitle;
  String image;
  String price;
  Function(BuildContext context) onDelete;
  Function(BuildContext context) onEdit;
  Function(BuildContext context) onDetail;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(index),
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        dismissible: null,
        extentRatio: 0.75,
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: onDelete,
            backgroundColor: RED,
            foregroundColor: Colors.white,
            icon: Icons.delete_outlined,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: onEdit,
            backgroundColor: GREEN,
            foregroundColor: Colors.white,
            icon: Icons.edit_outlined,
            label: 'Edit',
          ),
          SlidableAction(
            onPressed: onDetail,
            backgroundColor: BLUE,
            foregroundColor: Colors.white,
            icon: Icons.details_outlined,
            label: 'Detail',
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.roboto(),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.roboto(
            color: GREEN,
          ),
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          child: Image.network(image ?? ""),
        ),
        trailing: Text(
          "Rp.${price}",
          style: GoogleFonts.roboto(
            color: BLUE,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
