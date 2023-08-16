import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../widgets/side_drawer.dart';
import 'all_offers_widget.dart';
import 'popular_stores_list.dart';
import 'screen2appbar.dart';

class screen2 extends StatefulWidget {
  String disctName;

  screen2({super.key, required this.disctName,});
  @override
  State<screen2> createState() => _screen2State();
}
class _screen2State extends State<screen2> {
  @override
  void initState() {
    super.initState();
    loadDistrictData();
    loadtagList();
    loadExpData();
  }

  List tagList = [];
  loadtagList() async {
    final Response = await http.get(Uri.parse(
        "https://showmydeals.in/api/tags"));
    if (Response.statusCode == 200) {
      var converted = json.decode(Response.body);
      tagList = converted["tags"];
      setState(() {});
    }
  }

  List ShopData = [];
  loadDistrictData() async {
    final Response = await http.get(Uri.parse(
        "https://showmydeals.in/api/${widget.disctName.toLowerCase()}/offers"));

    if (Response.statusCode == 200) {
      var converted = json.decode(Response.body);
      ShopData = converted["offers"];
      setState(() {});
    }
  }

  List ExpData = [];
  loadExpData() async {
    final Response = await http.get(Uri.parse(
        "https://showmydeals.in/api/${widget.disctName.toLowerCase()}/offers"));

    if (Response.statusCode == 200) {
      var converted = json.decode(Response.body);
      ExpData = converted["expoffers"];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer: const SideDrawer(),
      body: ListView(
        children: [
           Screen2appBar(screen2name: widget.disctName, tagNames: tagList,),
          PopularStoreList(
            currentWidth: currentWidth,
            disctName: widget.disctName,
          ),
          AllOffersWidget(widget: widget, OfferData: ShopData, expList: ExpData,),
        ],
      ),
    );
  }
}
