import 'package:get/get.dart';
import 'package:getx_statemanagement/models/product.dart';

class ShoppingController extends GetxController {
  var products = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          productName: 'FirstProduct',
          productImage: 'abd',
          productDescription: 'some description about product',
          price: 30),
      Product(
          id: 2,
          productName: 'SecondProduct',
          productImage: 'xyz',
          productDescription: 'some description about product',
          price: 40),
      Product(
          id: 3,
          productName: 'ThirdProduct',
          productImage: 'nmo',
          productDescription: 'some description about product',
          price: 50)
    ];
    products.value = productResult;
  }
}
