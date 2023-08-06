import 'package:flutter/material.dart';
import '../constants.dart';
import '../screen2/appBar_offer_list.dart';
import 'app_bar_buttons.dart';
import 'customAppBar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TypesOfOffer extends StatefulWidget {
  String disctName;
  List tagNames;
  String tagName;
  TypesOfOffer({super.key,
      required this.disctName,
      required this.tagNames,
      required this.tagName,});

  @override
  State<TypesOfOffer> createState() => _TypesOfOfferState();
}

class _TypesOfOfferState extends State<TypesOfOffer> {

  List offerData = [];
  //List expData = [];
  loadshoptagdata() async {
    final Response = await http.get(Uri.parse(
        "https://showmydeals.in/api/kozhikode/offers?tag=${widget.tagName.toLowerCase()}"));

    if (Response.statusCode == 200) {
      print(Response.body);
      var js = json.decode(Response.body);
      setState(() {
        //expData = js["expoffers"];
        offerData = js["offers"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          const CustomAppBar(),
          AppBarButtons(screen2name: widget.disctName, i: 1,),
          const SizedBox(
            height: 15,
          ),
          AppBarOfferList(
            currentWidth: currentWidth,
            screen2name: widget.disctName,
            tagNames: widget.tagNames,
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: 45,
            ),
            margin:
                const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 20),
            decoration: kContainerStyle,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('${widget.tagName} Offers in ${widget.disctName}',
                  style: kTextHeadingStyle),
              //TODO:TAG BASED OFFER
            ),
          )
        ],
      ),
    );
  }
}
