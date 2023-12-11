import 'package:pay_on_way_app/models/address.dart';

import '../models/product.dart';

class Cafe {
  late String name;
  late List<Address> theActualAddresses;
  late List<Product> theMenu;

  Cafe({required this.name, required this.theActualAddresses, required this.theMenu});
}