import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showmydealsapp/widgets/task_data.dart';

import '../screen2/screen2main.dart';

class DropdownList extends StatefulWidget {
  String _selectedItem = 'Select Location';
  @override
  _DropdownListState createState() => _DropdownListState();
}

class _DropdownListState extends State<DropdownList> {
  @override
  void initState() {
    super.initState();
    Provider.of<TaskData>(context, listen: false).getDistrictData();
  }



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
            value: widget._selectedItem == 'Select Location' ? null : widget._selectedItem,
            onChanged: (String? newValue) {
              setState(() {
                widget._selectedItem = newValue ?? 'Select Location';
              });

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => screen2(disctName: widget._selectedItem,)));
            },
            items: dropdownItems.map<DropdownMenuItem<String>>((dynamic value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            style:
                TextStyle(color: Colors.black, backgroundColor: Colors.white),
            underline: SizedBox(),
          ),
          if (widget._selectedItem == 'Select Location')
            //for(var item in dropdownItems)
            Text(
              widget._selectedItem,
              style: TextStyle(color: Colors.black),
            ),
        ],
      ),
    );
  }
}
