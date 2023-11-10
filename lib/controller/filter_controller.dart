import 'package:get/get.dart';

class FilterController extends GetxController {
  var isLeftRightCheck = 1.obs;
  var headChinCheck = 1.obs;
  var noseReshape = 1.obs;

  void setLeftRightCheck(int selectedItem) {
    isLeftRightCheck.value = selectedItem;
    update();
  }

  void setHeadChin(int selectedItem) {
    headChinCheck.value = selectedItem;
    update();
  }


  void setNoseReshape(int selectedItem) {
    noseReshape.value = selectedItem;
    update();
  }
}
