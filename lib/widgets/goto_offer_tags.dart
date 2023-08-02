import 'package:flutter/material.dart';
import '../constants.dart';
import '../screen2/appBar_offer_list.dart';
import 'app_bar_buttons.dart';
import 'customAppBar.dart';

class TypesOfOffer extends StatelessWidget {
  String disctName;
  List tagNames;
  String tagName;
  TypesOfOffer(
      {super.key,
      required this.disctName,
      required this.tagNames,
      required this.tagName});

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
          AppBarOfferList(
            currentWidth: currentWidth,
            screen2name: disctName,
            tagNames: tagNames,
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
              child: Text('$tagName Offers in $disctName',
                  style: kTextHeadingStyle),
              //TODO:TAG BASED OFFER
            ),
          )
        ],
      ),
    );
  }
}
