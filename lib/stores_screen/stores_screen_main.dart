import 'package:flutter/material.dart';
import '../widgets/app_bar_buttons.dart';
import '../widgets/customAppBar.dart';
import '../widgets/side_drawer.dart';
import 'all_stores_widget.dart';
import 'appbar_stores_tags.dart';

class StoresScreenMain extends StatelessWidget {
  final String disctName;
  const StoresScreenMain({
    super.key,
    required this.disctName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      endDrawer: const SideDrawer(),
      body: ListView(
        children: [
          //const CustomAppBar(),
          AppBarButtons(
            screen2name: disctName, i: 0,
          ),
          const SizedBox(
            height: 15,
          ),
           AppBarStoreTags(disctName: disctName,),
          AllStoresWidget(disctName: disctName,),
        ],
      ),
    );
  }
}
