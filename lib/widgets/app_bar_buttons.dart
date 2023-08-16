import 'package:flutter/material.dart';
import '../constants.dart';
import '../screen2/screen2main.dart';
import '../stores_screen/stores_screen_main.dart';

class AppBarButtons extends StatefulWidget {
  String screen2name;
  int i;

  AppBarButtons({super.key, required this.screen2name, required this.i});

  @override
  State<AppBarButtons> createState() => _AppBarButtonsState();
}

class _AppBarButtonsState extends State<AppBarButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        customBttons(
          btnColor: (widget.i != 0) ? kPinkColor : const Color(0xFFE5E5E5),
          text: 'Offers',
          ontap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => screen2(
                      disctName: widget.screen2name,
                    )));
          },
          textcolor: (widget.i == 0) ? Colors.black : Colors.white,
        ),
        customBttons(
          btnColor: (widget.i != 0)
              ? const Color(0xFFE5E5E5)
              : kPinkColor,
          text: 'Stores',
          ontap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => StoresScreenMain(
                      disctName: widget.screen2name,
                    )));
          },
          textcolor: (widget.i == 0) ? Colors.white : Colors.black,
        ),
      ],
    );
  }
}

class customBttons extends StatelessWidget {
  Color textcolor;
  Color btnColor;
  String text;
  Function() ontap;
  customBttons(
      {super.key,
      required this.textcolor,
      required this.text,
      required this.ontap,
      required this.btnColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 170,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            color: btnColor),
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: textcolor, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}
