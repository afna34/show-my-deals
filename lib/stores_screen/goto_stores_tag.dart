import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/app_bar_buttons.dart';
import '../widgets/customAppBar.dart';
import 'appbar_stores_tags.dart';

class GotoStoresTagScreen extends StatelessWidget {
  String disctName;

  GotoStoresTagScreen({super.key,required this.disctName});

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          CustomAppBar(),
          AppBarButtons(screen2name: disctName),
          const SizedBox(
            height: 15,
          ),
          AppBarStoreTags(disctName: disctName,),

          Container(
            padding: const EdgeInsets.only(
              bottom: 45,
            ),
            margin:
            const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 20),
            decoration: kContainerStyle,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('its in',
                  style: kTextHeadingStyle),
              //TODO:TAG BASED OFFER
            ),
          )
        ],
      ),
    );
  }
}
