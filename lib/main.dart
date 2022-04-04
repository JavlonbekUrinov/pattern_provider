import 'package:flutter/material.dart';
import 'package:pattern_provider/pages/add_page.dart';
import 'package:pattern_provider/pages/update_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        AddPage.id: (context) => AddPage(),
        UpdatePage.id: (context) => UpdatePage(),
      },
    );
  }
}
