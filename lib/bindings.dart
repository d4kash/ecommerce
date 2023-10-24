import 'package:get/get.dart';
import 'package:liftu_ecommerce/controller/getProductController.dart';

class ControllerBindings extends Bindings {

  @override
  void dependencies() {
    Get.put<ProductController>(ProductController());
  }
}