import 'package:flutter/material.dart';

class GoToStore extends StatelessWidget {
  List shopData;
  String Selectshop;

   GoToStore({super.key,required this.shopData,required this.Selectshop});
//TODO:NEED TO CONSTRUCT
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              //shops.isGroup,shops.isShop
              for(var item in shopData)
              Text(item["isGroup"]==true?'group':'shop'),
            ],
          ),
        ),
      ),
    );
  }
}
