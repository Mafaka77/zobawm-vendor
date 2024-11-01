import 'package:flutter/material.dart';
import 'package:zobawm_vendor_app/components/my_colors.dart';

textBoxDecorationStyle(String label) {
  return InputDecoration(
    isDense: true,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: MyColors.blue),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: MyColors.blue),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: MyColors.blue),
    ),
    labelText: label,
    counterText: '',
  );
}
