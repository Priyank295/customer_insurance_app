import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomDropDownController extends GetxController {
  var selectedValue = ''.obs;
  var error = false.obs;
  // var errorMessage = ''.obs;

  void validate(String value) {
    if (value == '') {
      error.value = true;
      // errorMessage.value = 'This field is required';
    } else {
      error.value = false;
      // errorMessage.value = '';
    }
  }
}

class CustomDobTextFieldController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var controller = TextEditingController().obs;
  void onDateChanged(DateTime newDate) {
    selectedDate.value = newDate;
    controller.value.text = DateFormat.yMd().format(selectedDate.value);
  }
}

class CustomRadioButtonController extends GetxController {
  int selectedIndex = -1;
  void onRadioButtonClicked(int index) {
    selectedIndex = index;
    update();
  }
}

class HomeScreenController extends GetxController {
  var selectedIndex = 0.obs;
  void onTabTapped(int index) {
    selectedIndex.value = index;
    update();
  }
}

class MedicalIfFamilyController extends GetxController {
  RxList<String> selectedItems = <String>[].obs;
  var familyFields = 1.obs;

  void onItemClicked(String item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
    update();
  }

  void increment() {
    familyFields++;
    update();
  }
}
