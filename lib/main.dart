import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:showmydealsapp/screen1/home_screens.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'widgets/task_data.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
         options: DefaultFirebaseOptions.currentPlatform,
       );
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


