import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/home_page.dart';

Future<void> main() async {
  //init the hive
  await Hive.initFlutter();
  // open the box
  var box = await Hive.openBox("myBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
