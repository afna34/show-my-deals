import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/goto_offer_tags.dart';
import 'screen2main.dart';

class AppBarOfferList extends StatelessWidget {
  const AppBarOfferList({
    super.key,
    required this.currentWidth,
    required this.screen2name,
    required this.tagNames,
  });

  final double currentWidth;
  final String screen2name;
  final List tagNames;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 10),
      color: kPinkColor,
      height: 50,
      width: currentWidth,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => screen2(disctName: screen2name,),
                  ),
                );
              },
              child: const Text(
                'All',
                style: kSmallWhiteTextStyle,
              ),
            ),
            const Divider(),
            for (var item in tagNames)
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => GotoOfferTags(disctName: screen2name, tagNames: tagNames, tagName:  item["name"],tagId : item["tag"]),
                        ),
                      );
                    },
                    child: Text(
                      item["name"],
                      style: kSmallWhiteTextStyle,
                    ),
                  ),
                  const Divider(),
                ],
              )
          ],
        ),
      ),
    );
  }
}

class Divider extends StatelessWidget {
  const Divider({super.key});

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(
      color: Colors.white,
      thickness: 0.5,
      endIndent: 15,
      indent: 15,
    );
  }
}
