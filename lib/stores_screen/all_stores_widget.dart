import 'package:flutter/material.dart';
import '../constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../screen2/is_group_store.dart';
import '../screen2/is_shop_store.dart';

class AllStoresWidget extends StatefulWidget {
  final String disctName;

  const AllStoresWidget({
    super.key,
    required this.disctName,
  });

  @override
  State<AllStoresWidget> createState() => _AllStoresWidgetState();
}

class _AllStoresWidgetState extends State<AllStoresWidget> {
  List shop = [];
  Future<dynamic> loadShopData() async {
    final response = await http.get(Uri.parse(
        "https://showmydeals.in/api/${widget.disctName.toLowerCase()}/offers"));
    if (response.statusCode == 200) {
      var converted = json.decode(response.body);
      setState(() {
        shop = converted["shops"];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadShopData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 45,
      ),
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 20),
      decoration: kContainerStyle,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 10.0, top: 20, bottom: 20.0),
            child: Text(
              'All Stores in ${widget.disctName}',
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.5),
            ),
          ),
          Wrap(
            spacing: 18,
            runSpacing: 22.0,
            children: [
              for (var data in shop)
                InkWell(
                  onTap: () {
                    if (data["isGroup"]) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => IsStoreGroup(
                                  selectedDisct: widget.disctName,
                                  selectedGroupName: data["name"],
                                  shopId: data["id"],
                                )),
                      );
                    }
                    if (!data["isGroup"]) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => IsStoreShop(
                                  shopId: data["id"],
                                  disctName: widget.disctName,
                                )),
                      );
                    }
                  },
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            data["images"]["logo"]["url"],
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            data["name"],
                            style: const TextStyle(
                                fontSize: 13.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            data["isGroup"]
                                ? "All Stores in ${widget.disctName}"
                                : data["address"],
                            style: TextStyle(fontSize: 11.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
