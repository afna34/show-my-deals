import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TaskData extends ChangeNotifier {
  List disct = [];
  Future<dynamic> getDistrictData() async {
    http.Response response =
        await http.get(Uri.parse('https://showmydeals.in/api'));
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      disct = result['districts']
          .map((item) => capitalize(item)) // Capitalize each item
          .toList();
      notifyListeners();
      return disct;
    } else {
      print('it shows error');
    }
  }

  String capitalize(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1);
  }

  @override
  notifyListeners();
  String disctimg = '';
  Future<dynamic> gotoLocation() async {
    try {
      http.Response response =
          await http.get(Uri.parse('https://showmydeals.in/api/$disct/offers'));
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        disctimg = result.offers[0].thumbnail.url;
        return disctimg;
      } else {
        print('it shows error');
      }
      notifyListeners();
    } catch (e) {
       print(e);
    }
  }
}
