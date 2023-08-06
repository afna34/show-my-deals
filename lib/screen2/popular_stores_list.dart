import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants.dart';
import 'is_group_store.dart';
import 'is_shop_store.dart';

class PopularStoreList extends StatefulWidget {
  const PopularStoreList({
    super.key,
    required this.currentWidth,
    required this.disctName,
  });

  final double currentWidth;
  final String disctName;

  @override
  State<PopularStoreList> createState() => _PopularStoreListState();
}

class _PopularStoreListState extends State<PopularStoreList> {
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
      padding: const EdgeInsets.only(bottom: 30, top: 10),
      margin: const EdgeInsets.all(20),
      decoration: kContainerStyle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 8, top: 8),
            child: Text(
              'Popular Stores in ${widget.disctName}',
              style: kTextHeadingStyle,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            height: 80,
            width: widget.currentWidth,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 110,
                viewportFraction: 0.3,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              items: shop.map((data) {
                return Builder(
                  builder: (BuildContext context) {
                    return InkWell(
                      onTap: () {
                        if (data["isGroup"]) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => isStoreGroup(
                                      selectedshopData: data,
                                      groupList: data["groupMembers"],
                                      selectedDisct: widget.disctName,
                                      selectedGroupName: data["name"],
                                      storeLogo: data["images"]["logo"]["url"],
                                  groupBg: data["images"]["bg"]["url"],
                                    shopId: data["id"],
                                    )),
                          );
                        }
                        if (!data["isGroup"]) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => isStroreShop(
                                      shopslug: data["id"],
                                      storeLogo: data["images"]["logo"]["url"],
                                  selectedshopData: data,
                                    disctName:widget.disctName,
                                    )),
                          );
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        child: Image.network(
                          data["images"]["logo"]["url"],
                          height: 110,
                          width: 110,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
