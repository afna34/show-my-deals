import 'package:flutter/material.dart';
import '../widgets/side_drawer.dart';
import 'select_district_page.dart';
import '../constants.dart';
import '../widgets/customAppBar.dart';

class Screen1main extends StatelessWidget {
  const Screen1main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      endDrawer: const SideDrawer(),
      body: ListView(
        children: const[
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.red,
          ),
          SizedBox(
            height: 25,
          ),
          //Todo
          Text('Select your District',
              textAlign: TextAlign.center, style: kSelectDistrictStyle),
          SizedBox(
            height: 5,
          ),
          Text(
            'Discover Shops, Offers & Deals in your location',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 25,
          ),
          SelectDistrictPage(),
          SizedBox(
            height: 10,
          ),
          Text(
            'More locations will be available soon',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
