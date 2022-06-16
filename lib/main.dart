import 'package:flutter/material.dart';
import 'package:image_items_identification/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Items Detection',
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Tajawal'),
      home: const HomePage(),
    );
  }
}
