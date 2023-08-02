import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showmydealsapp/screen2/screen2main.dart';
import 'package:showmydealsapp/widgets/task_data.dart';
import '../constants.dart';

class SelectDistrictPage extends StatefulWidget {
  const SelectDistrictPage({super.key});

  @override
  State<SelectDistrictPage> createState() => _SelectDistrictPageState();
}

class _SelectDistrictPageState extends State<SelectDistrictPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<TaskData>(context, listen: false).getDistrictData();
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final taskData = Provider.of<TaskData>(context);
    final loactionList = taskData.disct;

    return Center(
      child: Column(
        children: [
          for (var item in loactionList)
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => screen2(disctName: item)));
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                height: currentWidth > kMinWidthOfLargeScreen
                    ? currentWidth / 8
                    : currentWidth / 4,
                width: currentWidth > kMinWidthOfLargeScreen
                    ? currentWidth - 200
                    : currentWidth - 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Center(child: Text(item, style: kDistrictBoxStyle)),
              ),
            ),
        ],
      ),
    );
  }
}


//import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:showmydealsapp/widgets/task_data.dart';
//
// import '../screen2/screen2main.dart';
//
// class DropdownList extends StatefulWidget {
//   @override
//   _DropdownListState createState() => _DropdownListState();
// }
//
// class _DropdownListState extends State<DropdownList> {
//   String? _selectedItem;
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedItem = 'Select an item';
//     Provider.of<TaskData>(context, listen: false).getDistrictData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final listData = Provider.of<TaskData>(context);
//     final dropdownItems = listData.disct;
//
//     return Container(
//       color: Colors.white,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           DropdownButton<String>(
//             value: _selectedItem,
//             onChanged: (String? newValue) {
//               setState(() {
//                 _selectedItem = newValue;
//               });
//               if (_selectedItem != null && _selectedItem != 'Select an item') {
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => screen2(disctName: _selectedItem!)));
//               }
//             },
//             items: [
//               DropdownMenuItem<String>(
//                 value: 'Select an item',
//                 child: Text('Select an item'),
//               ),
//               ...dropdownItems.map<DropdownMenuItem<String>>((value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ],
//             style: TextStyle(color: Colors.black, backgroundColor: Colors.white),
//             underline: SizedBox(),
//           ),
//         ],
//       ),
//     );
//   }
// }
