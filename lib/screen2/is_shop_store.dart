import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class isStroreShop extends StatefulWidget {
  var selectedshopData;
  String shopslug;
  String storeLogo;
  String disctName;
  isStroreShop({super.key, required this.shopslug,required this.storeLogo,required this.selectedshopData,required this.disctName});

  @override
  State<isStroreShop> createState() => _isStroreShopState();
}

//https://showmydeals.in/kozhikode/stores/ideal-super-store-thamarassery

class _isStroreShopState extends State<isStroreShop> {

  //https://showmydeals.in/api/kozhikode/stores/grand-hyper-focusmall
  //
  List storeData = [];
  Future<dynamic> loadStoreData() async {
    final response = await http.get(Uri.parse(
        "https://showmydeals.in/api/${widget.disctName.toLowerCase()}/stores/${widget.shopslug}"));
    if (response.statusCode == 200) {
      var converted = json.decode(response.body);
      setState(() {
        storeData = converted["store"];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadStoreData();
    print(storeData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: Text('hii'),
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
          //store.images.bg.url
         Container(
           // decoration: BoxDecoration(
           //   image: DecorationImage(
           //     image: NetworkImage(storeData["images"]["bg"]["url"]),
           //     fit: BoxFit.cover,
           //   ),
           // ),
           child: Column(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Container(
                     margin: const EdgeInsets.only(left: 5, right: 5),
                     child: Image.network(
                       widget.storeLogo,
                       height: 100,
                       width: 100,
                     ),
                   ),
                   Text(widget.selectedshopData["name"]),
                 ],
               ),
               Text(widget.selectedshopData["address"]),
             ],
           ),
         )
        ],
      ),
    );
  }
}