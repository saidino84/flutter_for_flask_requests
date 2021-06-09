import 'package:flask_reqsts/shared.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FlaskRepository());
    Get.lazyPut(() => HomeController(repository: Get.find()));
  }
}
