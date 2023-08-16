import 'package:flutter/material.dart';
import 'package:showmydealsapp/constants.dart';
import '../widgets/commonAppBar.dart';
import 'is_shop_store.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class IsStoreGroup extends StatefulWidget {
  String shopId;
  String selectedDisct;
  String selectedGroupName;
  IsStoreGroup({
    super.key,
    required this.selectedDisct,
    required this.shopId,
    required this.selectedGroupName,
  });

  @override
  State<IsStoreGroup> createState() => _IsStoreGroupState();
}

class _IsStoreGroupState extends State<IsStoreGroup> {
  List group = [];
  Future<dynamic> loadGroupData() async {
    final response = await http.get(Uri.parse(
        "https://showmydeals.in/api/${widget.selectedDisct.toLowerCase()}/group/${widget.shopId}"));
    if (response.statusCode == 200) {
      var converted = json.decode(response.body);
      setState(() {
        group = [converted["group"]];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadGroupData();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: const CommonAppBar(),
        body: Column(
          // scrollDirection: Axis.vertical,
          children: [
            for (var offerItem in group)
              Container(
                color: Colors.white,
                child: Image.network(
                  offerItem["images"]["bg"]["url"],
                  height: 100,
                  width: screenwidth,
                ),
              ),
            Container(
              height: screenHeight / 1.35,
              padding: const EdgeInsets.only(bottom: 30, top: 10),
              margin: const EdgeInsets.only(
                  top: 7, left: 20, right: 20, bottom: 20),
              decoration: kContainerStyle,
              child: ListView(
                scrollDirection: Axis.vertical,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Text(
                      '${widget.selectedGroupName} in ${widget.selectedDisct}',
                      style: kMediumHeadingTextStyle,
                    ),
                  ),
                  for (var offerItem in group)
                    for (var groupMember in offerItem["groupMembers"])
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => IsStoreShop(
                                    shopId: groupMember["id"],
                                    disctName: widget.selectedDisct,
                                  )));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            bottom: 10,
                            top: 10,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: kPinkColor, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          width: 330,
                          height: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 40,
                                color: kPinkColor,
                              ),
                              Text(
                                groupMember["name"],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17.0),
                              ),
                              Text(
                                groupMember["address"],
                              ),
                            ],
                          ),
                        ),
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
