import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zobawm_vendor_app/components/my_sizedbox.dart';
import 'package:zobawm_vendor_app/controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: Colors.transparent,
              elevation: 0,
              onPressed: () {
                Get.toNamed('/become-partner-screen');
              },
              label: const Text(
                'Become a Partner',
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.elliptical(400, 140)),
                          color: Color(0xff2e88ff),
                        ),
                        height: Get.height * 0.33,
                      ),
                      const Positioned(
                        bottom: 15,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 24,
                                letterSpacing: 8,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            // reusableWidget.twoLine(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  heightSizedBox(40),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: controller.mobileNo,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter Mobile';
                              } else if (value.length < 10) {
                                return 'Enter valid mobile Number';
                              }
                              return null;
                            },
                            maxLength: 10,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              labelText: 'Mobile',
                              counterText: '',
                              isDense: true,
                              border: OutlineInputBorder(),
                            ),
                          ),
                          heightSizedBox(20),
                          Obx(
                            () => TextFormField(
                              controller: controller.password,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Password';
                                }
                                return null;
                              },
                              obscureText: controller.isPasswordVisble.isFalse
                                  ? true
                                  : false,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                counterText: '',
                                isDense: true,
                                border: const OutlineInputBorder(),
                                suffixIcon: controller.isPasswordVisble.isTrue
                                    ? IconButton(
                                        onPressed: () {
                                          controller.isPasswordVisble.value =
                                              false;
                                        },
                                        icon: const Icon(Icons.visibility))
                                    : IconButton(
                                        onPressed: () {
                                          controller.isPasswordVisble.value =
                                              true;
                                        },
                                        icon: const Icon(Icons.visibility_off)),
                              ),
                            ),
                          ),
                          heightSizedBox(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                height: Get.height * 0.06,
                                elevation: 0,
                                color: const Color(0xff191c51),
                                minWidth: Get.width * 0.5,
                                onPressed: () {},
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Login',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Icon(
                                      Icons.send,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
