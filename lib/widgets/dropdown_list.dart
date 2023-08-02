import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showmydealsapp/widgets/task_data.dart';

import '../screen2/screen2main.dart';

class DropdownList extends StatefulWidget {
  @override
  _DropdownListState createState() => _DropdownListState();
}

class _DropdownListState extends State<DropdownList> {
  @override
  void initState() {
    super.initState();
    Provider.of<TaskData>(context, listen: false).getDistrictData();
  }

  String _selectedItem = 'Select Location';

  @override
  Widget build(BuildContext context) {
    final listData = Provider.of<TaskData>(context);
    final dropdownItems = listData.disct;

    return Container(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          DropdownButton<String>(
            value: _selectedItem == 'Select Location' ? null : _selectedItem,
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue ?? 'Select Location';
              });

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => screen2(disctName: _selectedItem,)));
            },
            items: dropdownItems.map<DropdownMenuItem<String>>((dynamic value) {
              //TODO:need to change the selet location sting if we select a value
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            style:
                TextStyle(color: Colors.black, backgroundColor: Colors.white),
            underline: SizedBox(),
          ),
          if (_selectedItem == 'Select Location')
            //for(var item in dropdownItems)
            Text(
              _selectedItem,
              style: TextStyle(color: Colors.black),
            ),
        ],
      ),
    );
  }
}
