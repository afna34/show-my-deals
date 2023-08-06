import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/customAppBar.dart';
import '../widgets/app_bar_buttons.dart';
import 'appBar_offer_list.dart';

class Screen2appBar extends StatelessWidget {
  Screen2appBar({super.key, required this.screen2name, required this.tagNames});
  String screen2name;
  List tagNames;

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CustomAppBar(),
        AppBarButtons(screen2name: screen2name, i: 1,),
        const SizedBox(
          height: 15,
        ),
        AppBarOfferList(
            currentWidth: currentWidth,
            screen2name: screen2name,
            tagNames: tagNames),
      ],
    );
  }
}
