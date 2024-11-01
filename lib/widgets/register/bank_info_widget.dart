import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zobawm_vendor_app/components/my_colors.dart';
import 'package:zobawm_vendor_app/components/my_loader.dart';
import 'package:zobawm_vendor_app/components/my_sizedbox.dart';
import 'package:zobawm_vendor_app/controllers/auth_controller.dart';
import 'package:zobawm_vendor_app/controllers/register_controller.dart';
import 'package:zobawm_vendor_app/styles/text_box_decoration_style.dart';

class BankInfoWidget extends GetView<RegisterController> {
  final String roles;
  const BankInfoWidget({super.key, required this.roles});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: controller.bankFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              controller: controller.bankNameText,
              validator: (value) {
                if (value!.isEmpty || value == '') {
                  return 'Required';
                }
                return null;
              },
              decoration: textBoxDecorationStyle('Bank Name'),
            ),
            heightSizedBox(10),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: controller.bankAccNoText,
              validator: (value) {
                if (value!.isEmpty || value == '') {
                  return 'Required';
                }
                return null;
              },
              decoration: textBoxDecorationStyle('Account No'),
            ),
            heightSizedBox(10),
            TextFormField(
              controller: controller.bankIfscText,
              validator: (value) {
                if (value!.isEmpty || value == '') {
                  return 'Required';
                }
                return null;
              },
              decoration: textBoxDecorationStyle('IFSC Code'),
            ),
            heightSizedBox(10),
            TextFormField(
              controller: controller.bankAccHolder,
              validator: (value) {
                if (value!.isEmpty || value == '') {
                  return 'Required';
                }
                return null;
              },
              decoration: textBoxDecorationStyle('Account Holder Name'),
            ),
            heightSizedBox(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  elevation: 0,
                  minWidth: Get.width * 0.4,
                  onPressed: () {
                    controller.activeStep.value = 2;
                  },
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                    color: MyColors.blue,
                  )),
                  child: const Text('BACK'),
                ),
                MaterialButton(
                  elevation: 0,
                  color: MyColors.blue,
                  minWidth: Get.width * 0.4,
                  onPressed: () {
                    if (controller.bankFormKey.currentState!.validate()) {
                      controller.register(roles, () {
                        showLoader(context);
                      }, () {
                        hideLoader();
                      }, () {
                        hideLoader();
                      });
                    }
                  },
                  child: const Text('SUBMIT'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
