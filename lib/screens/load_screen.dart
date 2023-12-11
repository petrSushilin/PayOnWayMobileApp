import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_on_way_app/screens/login_screen.dart';

class MyLoadPage extends StatelessWidget {
  const MyLoadPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
        () => 
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => MyLoginPage(label: '',)))
    );

    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: Center (
            child: SvgPicture.asset("assets/images/load_screen_image.svg"),
          ),
        )
      ),
    );
  }
}