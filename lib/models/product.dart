class Product{
  late String nameOfProduct;
  late ProductType type;
  late double cost;

  Product({
    required this.nameOfProduct,
    required this.type,
    required this.cost
  });
}
class ProductType {
  late String type;

  ProductType(this.type);
}