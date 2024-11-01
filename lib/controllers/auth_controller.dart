import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zobawm_vendor_app/services/auth_services.dart';

class AuthController extends GetxController {
  AuthServices services = Get.find(tag: 'authServices');
  var formKey = GlobalKey<FormState>();
  var mobileNo = TextEditingController();
  var password = TextEditingController();
  var isPasswordVisble = false.obs;
}
