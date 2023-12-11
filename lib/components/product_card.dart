import 'dart:ffi';

class ProductCard{
  late String nameOfProduct;
  late String type;
  late Double cost;

  ProductCard({
    required this.nameOfProduct,
    required this.type,
    required this.cost
  });
}