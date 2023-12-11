import 'package:flutter/material.dart';
import 'package:pay_on_way_app/screens/load_screen.dart';
import 'package:pay_on_way_app/screens/login_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay on way',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyLoadPage(title: 'Load page',),
    );
  }
}