import 'package:flutter/material.dart';
import 'package:showmydealsapp/constants.dart';
import 'is_shop_store.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class isStoreGroup extends StatefulWidget {
  var selectedshopData;
  String selectedDisct;
  String selectedGroupName;
  String storeLogo;
  List groupList;
  String groupBg;
  String shopId;
  //TODO:NEED TO SOLVE THIS ISSUE
  isStoreGroup({super.key,
      required this.selectedshopData,
      required this.groupList,
      required this.selectedDisct,
      required this.selectedGroupName,
        required this.storeLogo,
        required this.groupBg,
    required this.shopId,
      });

  @override
  State<isStoreGroup> createState() => _isStoreGroupState();
}

class _isStoreGroupState extends State<isStoreGroup> {

  List group = [];
  Future<dynamic> loadGroupData() async {
    final response = await http.get(Uri.parse(
        "https://showmydeals.in/api/${widget.selectedDisct.toLowerCase()}/group/${widget.shopId}"));
    if (response.statusCode == 200) {
      var converted = json.decode(response.body);https://showmydeals.in/kozhikode/group/greens
      print(response.body);
      setState(() {
        group = converted["group"]["groupMembers"];
      });
      print(group);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadGroupData();
    print(widget.shopId);
    print(widget.selectedDisct);
    print(group);
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final ScreenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // leading: Text('hii'),
          //TODO:ADD A BACK BUTTON ICON
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          title: Hero(
            tag: 'app_bar',
            child: Image.asset(
              'images/logo.png',
              height: 30,
            ),
          ),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            for(var item in group)
            Container(
              color: Colors.white,
              child: Image.network(
                //group["images"]["bg"]["url"],
                widget.groupBg,
                height: 100,
                width: screenWidth,
              ),
            ),
            Container(
              height: ScreenHeight/1.35,
              padding: const EdgeInsets.only(bottom: 30, top: 10),
              margin: const EdgeInsets.only(top: 7, left: 20, right: 20, bottom: 20),
              decoration: kContainerStyle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Text(
                      '${widget.selectedGroupName} in ${widget.selectedDisct}',
                      style: kMediumHeadingTextStyle,
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    direction: Axis.vertical,
                    children: [
                      for (var element in widget.groupList)
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    isStroreShop(shopslug: element["id"], storeLogo: widget.storeLogo, selectedshopData: widget.selectedshopData, disctName: widget.selectedDisct,)));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10,top: 10,),
                            decoration: BoxDecoration(border: Border.all(color: kPinkColor,width: 1),borderRadius: BorderRadius.circular(10)),
                            width: 330,
                            height: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [for(var item in group)Text(item["address"]),

                                //for(var item in group)Text(item["groupMembers"]["address"])
                                // const Icon(Icons.location_on,color: kPinkColor,size: 45.0,),
                                // Text(element["name"],style: const TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                                // Text(element["groupMembers"]["address"],),
                                //shops[0].groupMembers[0].address
                                //Text(element["groupMembers"]["address"],),
                                //shops[2].groupMembers[0].address
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
