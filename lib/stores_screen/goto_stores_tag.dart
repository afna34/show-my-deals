import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/app_bar_buttons.dart';
import '../widgets/customAppBar.dart';
import '../widgets/side_drawer.dart';
import 'appbar_stores_tags.dart';

class GotoStoresTagScreen extends StatelessWidget {
  String disctName;
  String tagSelected;
  GotoStoresTagScreen(
      {super.key,
      required this.disctName,
      required this.tagSelected,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const SideDrawer(),
      body: ListView(
        children: [
          const CustomAppBar(),
          AppBarButtons(
            screen2name: disctName,
            i: 0,
          ),
          const SizedBox(
            height: 15,
          ),
          AppBarStoreTags(
            disctName: disctName,
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: 45,
            ),
            margin:
                const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 20),
            decoration: kContainerStyle,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child:
                  Text("$tagSelected in $disctName", style: kTextHeadingStyle),
              //TODO:TAG BASED OFFER
            ),
          )
        ],
      ),
    );
  }
}
