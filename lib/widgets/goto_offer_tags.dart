import 'package:flutter/material.dart';
import '../constants.dart';
import '../screen2/appBar_offer_list.dart';
import '../screen2/poster_screen.dart';
import 'app_bar_buttons.dart';
import 'customAppBar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'side_drawer.dart';

class GotoOfferTags extends StatefulWidget {
  String disctName;
  List tagNames;
  String tagName;
  String tagId;
  GotoOfferTags({
    super.key,
    required this.disctName,
    required this.tagNames,
    required this.tagName,
    required this.tagId,
  });

  @override
  State<GotoOfferTags> createState() => _GotoOfferTagsState();
}

class _GotoOfferTagsState extends State<GotoOfferTags> {
  List offerData = [];
  loadshoptagdata() async {
    final response = await http.get(Uri.parse(
        "https://showmydeals.in/api/${widget.disctName.toLowerCase()}/offers?tag=${widget.tagId}"));
    if (response.statusCode == 200) {
      var js = json.decode(response.body);
      setState(() {
        //expData = js["expoffers"];
        offerData = js["offers"];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadshoptagdata();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer: const SideDrawer(),
      body: ListView(
        children: [
          const CustomAppBar(),
          AppBarButtons(
            screen2name: widget.disctName,
            i: 1,
          ),
          const SizedBox(
            height: 15,
          ),
          AppBarOfferList(
            currentWidth: currentWidth,
            screen2name: widget.disctName,
            tagNames: widget.tagNames,
          ),
          if (offerData.length > 1)
          Container(
            padding: const EdgeInsets.only(
              bottom: 45,
            ),
            margin:
                const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 20),
            decoration: kContainerStyle,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('${widget.tagName} Offers in ${widget.disctName}',
                      style: kTextHeadingStyle),
                ),
                Wrap(
                  runSpacing: 20,
                  spacing: 9,
                  children: [
                    for (var item in offerData)
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PosterScreen(
                                disctName: widget.disctName,
                                imageLink: item["pages"],
                                posterId: item["id"],
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
                                                  item["thumbnail"]["url"],
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
                                            "${item["offerCount"]} Pages",
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
                                  '${item["viewCount"]} Views',
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          )
          //TODO:NEED TO CHECK WAITING AND IF !WAITING IMPLEMENT THIS SIZEDBOX
          else
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
  }
}
