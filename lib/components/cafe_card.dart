import 'package:pay_on_way_app/components/address_card.dart';

import '../models/product.dart';

class CafeCard{
  late String nameOfShop;
  late List<AddressCard> theActualAddresses;
  late List<Product> theMenu;

  CafeCard({
    required this.nameOfShop,
    required this.theActualAddresses,
    required this.theMenu
  });
}