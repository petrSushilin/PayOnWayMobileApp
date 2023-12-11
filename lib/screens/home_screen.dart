import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:pay_on_way_app/components/address_card.dart';
import 'package:pay_on_way_app/models/address.dart';
import 'package:pay_on_way_app/models/cafe.dart';
import 'package:pay_on_way_app/models/product.dart';
import 'package:pay_on_way_app/screens/login_screen.dart';

import '../components/cafe_card.dart';
import 'home_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    required this.label,
    this.controller,
    this.error,
    this.icon,
  });

  final TextEditingController? controller;
  final String label;
  final String? error;
  final Widget? icon;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List _imageAssets = [
    'assets/images/new_client_sale.jpg',
    'assets/images/invite_friend_sale.jpg',
    'assets/images/tomorrow_sale.jpg',
  ];

  final List<Cafe> _cafeList = [
    Cafe(name: "Joe's coffee", theActualAddresses: <Address>[
      Address('SaintP', '', 'Lenina str.', '20', 'lit. A'),
      Address('SaintP', 'Pushkin', 'Sadovaya str.', '8', ''),
    ], theMenu: <Product>[
      Product(
        nameOfProduct: 'Latte',
        type: ProductType('Coffee'),
        cost: 80.0,
      ),
      Product(
          nameOfProduct: 'Espresso', type: ProductType('Coffee'), cost: 60.0)
    ]),
    Cafe(name: "Wallie's coffee", theActualAddresses: <Address>[
      Address('SaintP', '', 'Sennaya str.', '25', ''),
      Address('SaintP', 'Pushkin', 'Sadovaya str.', '12', ''),
    ], theMenu: <Product>[
      Product(
        nameOfProduct: 'Latte',
        type: ProductType('Coffee'),
        cost: 70.0,
      ),
      Product(
          nameOfProduct: 'Espresso', type: ProductType('Coffee'), cost: 70.0)
    ]),
  ];

  @override
  Widget build(BuildContext context) =>
    Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrollable) => [
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(70),
              itemCount: _cafeList.length,
              itemBuilder: (_, index) =>
                  Text(
                    '$index + ${_cafeList[index].name} + ${_cafeList[index]
                        .theMenu} + ${_cafeList[index]
                        .theActualAddresses[0]} + ${_cafeList[index]
                        .theActualAddresses[0]} + ${_cafeList[index]
                        .theActualAddresses[0]} + ${_cafeList[index]
                        .theActualAddresses[0]}',
                    style: const TextStyle(fontSize: 25),
                  ),
            )
          ],
          body: Padding(
            padding: const EdgeInsets.only(top: 70.0, bottom: 5),
            child: SizedBox(
              width: 360,
              height: 180,
              child: Swiper(
                itemCount: _imageAssets.length,
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    _imageAssets[index],
                    fit: BoxFit.fill,
                  );
                },
                pagination: const SwiperPagination(),
              ),
            ),
          )
      )
    );
}