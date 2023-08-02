import 'package:flutter/material.dart';
import 'dropdown_list.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(
      kToolbarHeight + 2.0); // Add 2.0 to accommodate the border

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      title: Hero(
        tag: 'app_bar',
        child: Image.asset(
          'images/logo.png',
          height: 30,
        ),
      ),
      actions: [
        SizedBox(width: 20,),
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFe5e5e5)),
          child: DropdownList(),
          // TextButton(
          //     onPressed: () {},
          //     child: const Text(
          //       'Add my store',
          //       style: kAddMystoreTextStyle
          //     )),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
