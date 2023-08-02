import 'package:flutter/material.dart';
import 'package:showmydealsapp/stores_screen/goto_stores_tag.dart';
import '../constants.dart';

class AppBarStoreTags extends StatelessWidget {
  final String disctName;
  const AppBarStoreTags({super.key, required this.disctName});

  @override
  Widget build(BuildContext context) {
    List<String> appBarItems = [
      'All',
      'Hyper Markets',
      'Super Markets',
      'Dealership',
      'Stores',
      'Groups'
    ];

    final currentWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 10),
      color: kPinkColor,
      height: 50,
      width: currentWidth,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var item in appBarItems)
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => GotoStoresTagScreen(
                          disctName: disctName,
                        ),
                      ),
                    );
                  },
                  child: Row(children: [
                    Text(
                      item,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Divider(),
                  ])),
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
