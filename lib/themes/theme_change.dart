import 'package:flutter/material.dart';

class ThemeChange {

  final ValueNotifier<bool> teste = ValueNotifier<bool>(false);

  changeTheme() {
    if(teste.value == true) {
      teste.value = false;
    } else {
      teste.value = true;
    }
  }
}