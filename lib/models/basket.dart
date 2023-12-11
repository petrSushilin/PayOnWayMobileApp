import '../models/product.dart';

class Basket {
  late String cafeName;
  late List<Product> productList;

  Basket(this.cafeName, this.productList);
}