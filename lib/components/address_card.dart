import '../models/product.dart';

class AddressCard{
  late String cityName;
  late String townName;
  late String roadName;
  late String buildNumber;
  late String postfixBuildNumber;

  AddressCard(
    this.cityName,
    this.townName,
    this.roadName,
    this.buildNumber,
    this.postfixBuildNumber
  );
}