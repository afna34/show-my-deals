
import 'package:flutter/material.dart';
import '../constants.dart';
import 'stores_screen_main.dart';

class AllStoresWidget extends StatelessWidget {
  const AllStoresWidget({
    super.key,
    required this.widget,
    required this.shop,
  });

  final StoresScreenMain widget;
  final List shop;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 45,),
      margin:
      const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 20),
      decoration: kContainerStyle,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 10.0,top: 15),
            child: Text(
              'All Stores in ${widget.disctName}',
              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16.5),
            ),
          ),
          Wrap(
            spacing: 18,
            runSpacing: 0.0,
            children: [
              for (var data in shop)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: Image.network(
                          data["images"]["logo"]["url"],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Text(data["name"],style: const TextStyle(fontWeight: FontWeight.w500),),
                    //Text(data["address"])
                  ],
                ),
            ],
          )
        ],
      ),
    );
  }
}
