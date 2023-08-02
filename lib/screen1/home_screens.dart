import 'package:flutter/material.dart';
import 'select_district_page.dart';
import '../constants.dart';
import '../widgets/customAppBar.dart';

class Screen1main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
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
