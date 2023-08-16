import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/commonAppBar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'is_group_store.dart';
import 'is_shop_store.dart';

class PosterScreen extends StatefulWidget {
  final String disctName;
  final List<dynamic> imageLink;
  final String posterId;
  const PosterScreen({
    super.key,
    required this.disctName,
    required this.imageLink,
    required this.posterId,
  });

  @override
  State<PosterScreen> createState() => _PosterScreenState();
}

class _PosterScreenState extends State<PosterScreen> {
  int _currentIndex = 0;

  final CarouselController _carouselController = CarouselController();
  List offerData = [];
  loadOfferData() async {
    final response = await http.get(Uri.parse(
        "https://showmydeals.in/api/${widget.disctName.toLowerCase()}/offer/${widget.posterId}"));
    if (response.statusCode == 200) {
      var converted = json.decode(response.body);
      setState(() {
        offerData = [converted["offer"]];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadOfferData();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          const CommonAppBar(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: 350.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  viewportFraction: 0.9,
                  aspectRatio: 16 / 9,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index; // Update current index
                    });
                  },
                ),
                items: widget.imageLink.map((item) {
                  return Container(
                    margin: const EdgeInsets.only(top: 65),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(item),
                        fit: BoxFit.fill,
                      ),
                    ),
                    width: 230,
                    height: 380,
                  );
                }).toList(),
              ),
              for (var offerItem in offerData)
                SizedBox(height: offerItem["isGroup"] ? 10.0 : 45.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.imageLink.length,
                  (index) => Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index ? kPinkColor : Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              for (var offerItem in offerData)
                for (var groupMember in offerItem["groupMembers"])
                  offerItem["isGroup"]
                      ? Container(
                          margin: const EdgeInsets.only(bottom: 10, top: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: kPinkColor, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 320,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                groupMember["name"],
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                groupMember["address"],
                                style: const TextStyle(fontSize: 15),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => IsStoreShop(shopId: groupMember["id"], disctName: widget.disctName)
                                    ),
                                  );
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    'View Profile',
                                    style: TextStyle(
                                        color: kPinkColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                               ),
                              )
                            ],
                          ),
                        )
                      : const SizedBox(height: 10.0),
              Container(
                margin: const EdgeInsets.only(top: 40),
                height: screenHeight / 2.7,
                width: screenWidth,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var item in offerData)
                        Text(
                          item["isGroup"]
                              ? item["groupname"]
                              : item["shopname"],
                          style: kMediumHeadingTextStyle,
                        ),
                      const SizedBox(
                        height: 15,
                      ),
                      for (var item in offerData)
                        Text(item["isGroup"]
                            ? widget.disctName
                            : item["shopaddress"]),
                      for (var item in offerData)
                        item["isGroup"]
                            ? const SizedBox(
                                height: 12.0,
                              )
                            : Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => IsStoreShop(
                                            shopId: item["shopid"],
                                            disctName: widget.disctName,
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Visit Profile',
                                      style: TextStyle(
                                          color: kPinkColor,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                      for (var item in offerData)
                        Text(
                          item["name"],
                          style: kSmallBoldHeadingStyle,
                        ),
                      for (var item in offerData)
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text('Valid from : ${item["from"]}'),
                        ),
                      for (var item in offerData)
                        Text('Valid till : ${item["to"]}')
                    ],
                  ),
                ),
              ),
              //
            ],
          )
        ],
      ),
    );
  }
}
