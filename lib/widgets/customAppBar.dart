import 'package:flutter/material.dart';
import 'dropdown_list.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + 2.0); // Add 2.0 to accommodate the border

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
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFFe5e5e5),
          ),
          child: DropdownList(),
        ),
        const SizedBox(
          width: 16,
        ),
        IconButton(
          icon: const Icon(Icons.menu,color: Colors.black,), // Use the desired icon here
          onPressed: () {
            // Open the side drawer
            Scaffold.of(context).openEndDrawer();
          },
        ),
      ],
    );
  }
}
