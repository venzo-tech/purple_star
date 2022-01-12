import 'package:get/get.dart';
import 'package:purple_star/screens/Model/product_model.dart';

class CartController extends GetxController{

  final _products = {}.obs;

  void addProduct(Product product){
    if(_products.containsKey(product)){
      _products[product]+=1;
    }else {
      _products[product]=1;
    }
    Get.snackbar(
      "Product Added",
      "You have added the ${product.title} to the cart",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  get products => _products;

  get productSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total =>
     _products.entries
          .map((product) => product.key.price * product.value)
          .toList()
          .fold<double>(0, (prev, element) => prev + element)
          .toStringAsFixed(2);


}