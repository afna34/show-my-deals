import 'package:flutter/material.dart';
import 'package:showmydealsapp/screen1/home_screens.dart';
import 'package:provider/provider.dart';
import 'widgets/task_data.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home:  Screen1main(),
      ),
    );
  }
}

