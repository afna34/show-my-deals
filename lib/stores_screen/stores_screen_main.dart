import 'package:flutter/material.dart';
import '../widgets/app_bar_buttons.dart';
import '../widgets/customAppBar.dart';
import 'all_stores_widget.dart';
import 'appbar_stores_tags.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StoresScreenMain extends StatefulWidget {
  final String disctName;
  const StoresScreenMain({
    super.key,
    required this.disctName,
  });

  @override
  State<StoresScreenMain> createState() => _StoresScreenMainState();
}

class _StoresScreenMainState extends State<StoresScreenMain> {
  List shop = [];
  Future<dynamic> loadDistrictData() async {
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
    loadDistrictData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const CustomAppBar(),
          AppBarButtons(
            screen2name: widget.disctName, i: 0,
          ),
          const SizedBox(
            height: 15,
          ),
           AppBarStoreTags(disctName: widget.disctName,),
          AllStoresWidget(widget: widget, shop: shop),
        ],
      ),
    );
  }
}
