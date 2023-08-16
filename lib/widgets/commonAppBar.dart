import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight + 2.0); // Add 2.0 to accommodate the border

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      leading: TextButton(onPressed: () {
        Navigator.of(context).pop();},
        child: const Icon(Icons.arrow_back,color: Colors.black,),),
      title: Hero(
        tag: 'app_bar',
        child: Image.asset(
          'images/logo.png',
          height: 30,
        ),
      ),
    );
  }
}
