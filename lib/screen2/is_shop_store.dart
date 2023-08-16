import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import '../constants.dart';
import '../widgets/commonAppBar.dart';
import 'exp_widget.dart';
import 'poster_screen.dart';

class IsStoreShop extends StatefulWidget {
  String shopId;
  String disctName;
  IsStoreShop({
    super.key,
    required this.shopId,
    required this.disctName,
  });

  @override
  State<IsStoreShop> createState() => _IsStoreShopState();
}

class _IsStoreShopState extends State<IsStoreShop> {
   bool isWaiting = true;

  List shop = [];
  List offer = [];
   Map<String, dynamic> storeData = {}; // Declare this at the top of your class

   Future<void> loadStoreData() async {
     final response = await http.get(Uri.parse(
         "https://showmydeals.in/api/${widget.disctName.toLowerCase()}/stores/${widget.shopId}"));
     if (response.statusCode == 200) {
       var converted = json.decode(response.body);
       setState(() {
         storeData = converted["store"];
         shop = [storeData];
         offer = converted["offers"];
       });
     }
   }


   @override
  void initState() {
    super.initState();
    loadStoreData();
  }

  @override
  Widget build(BuildContext context) {
    isWaiting =false;
    final screenwidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const CommonAppBar(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          for (var offerItem in shop)
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(offerItem["images"]["bg"]["url"]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                        child: Image.network(
                          offerItem["images"]["logo"]["url"],
                          height: 100,
                          width: 100,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              offerItem["name"],
                              softWrap: true,
                              style: kMediumWhiteTextStyle,maxLines: 2,
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              offerItem["address"],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ShopButtons(
                        screenwidth: screenwidth,
                        text: 'Call',
                        onpressed: () async {
                          final phone = 'tel:${storeData["contact"]["phone"]}'; // Use the API response key
                          if (await UrlLauncher.canLaunchUrl(Uri.parse(phone))) {
                            await UrlLauncher.launchUrl(Uri.parse(phone));
                          } else {
                            throw 'Could not launch $phone';
                          }
                        },
                      ),
                      ShopButtons(
                        screenwidth: screenwidth,
                        text: 'View on Map',
                        onpressed: () async {
                          final mapUrl = storeData["contact"]["googleMap"]; // Use the API response key
                          if (await UrlLauncher.canLaunchUrl(Uri.parse(mapUrl))) {
                            await UrlLauncher.launchUrl(Uri.parse(mapUrl));
                          } else {
                            throw 'Could not launch $mapUrl';
                          }
                        },
                      ),


                    ],
                  ),
                ],
              ),
            ),
          if (offer.length > 1)
            Container(
            padding: const EdgeInsets.only(bottom: 30, top: 10),
            margin: const EdgeInsets.only(top: 7, left: 20, right: 20, bottom: 20),
            decoration: kContainerStyle,
            child: Column(
              children: [
                for (var offerItem in shop)
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Text(
                      'All offers in  ${offerItem["name"]}',
                      style: kTextHeadingStyle,
                    ),
                  ),

                Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 20,
                  spacing: 9,
                  children: [
                    for (var data in offer)
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PosterScreen(
                                  disctName: widget.disctName,
                                  imageLink: data["pages"],
                                  posterId : data["id"]
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: kContainerStyle,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 155,
                                height: 230,
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        right: 0,
                                        bottom: 0,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  data["thumbnail"]["url"],
                                                ),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            width: 155,
                                            height: 180,
                                          ),
                                        )),
                                    Positioned(
                                        top: 10,
                                        right: 0,
                                        child: Container(
                                          decoration: kPageCountTagStyle,
                                          width: 60,
                                          height: 30,
                                          child: Center(
                                              child: Text(
                                                "${data["offerCount"]} Pages",
                                                style: const TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              )),
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 45.0, top: 5.0, bottom: 5.0),
                                decoration: kTopCornerCurvedContainer,
                                height: 20,
                                child: Text(
                                  '${data["viewCount"]} Views',
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    for (var data in offer) ExpWidget(data: data)
                  ],
                )

              ],
            ),
          )
          else if (!isWaiting)
          SizedBox(
            height: screenHeight/2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("images/nodata.png",scale: 3,),
                const Text('No offer Available'),
              ],
            ),
          ),
        ],
      ),
    );
  }}

class ShopButtons extends StatelessWidget {
   ShopButtons({
    super.key,
    required this.screenwidth,
    required this.text,
    required this.onpressed,
  });

  final double screenwidth;
  final String text;
  void Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: screenwidth/2.3,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
            onPressed: onpressed,
            child: Text(
              text,
              style: TextStyle(color: Colors.black),
            )));
  }
}


