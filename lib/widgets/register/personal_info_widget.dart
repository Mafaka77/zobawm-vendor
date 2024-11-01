import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zobawm_vendor_app/components/my_colors.dart';
import 'package:zobawm_vendor_app/components/my_sizedbox.dart';
import 'package:zobawm_vendor_app/controllers/auth_controller.dart';
import 'package:zobawm_vendor_app/controllers/register_controller.dart';
import 'package:zobawm_vendor_app/styles/text_box_decoration_style.dart';
import 'package:intl/intl.dart';

class PersonalInfoWidget extends GetView<RegisterController> {
  const PersonalInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: controller.personalInfoFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  Obx(
                    () => CircleAvatar(
                      radius: 60,
                      backgroundImage: controller.profile.value.path.isEmpty
                          ? const NetworkImage(
                              'https://cdn-icons-png.flaticon.com/128/10412/10412454.png')
                          : FileImage(File(controller.profile.value.path)),
                    ),
                  ),
                  Positioned(
                    bottom: -5,
                    right: -5,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: IconButton(
                        onPressed: () {
                          openPickerModal(context, controller);
                        },
                        icon: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            heightSizedBox(20),
            TextFormField(
              validator: (value) {
                if (value == '' || value!.isEmpty) {
                  return 'Required';
                }
                return null;
              },
              controller: controller.fullNameText,
              decoration: textBoxDecorationStyle('Full Name'),
            ),
            heightSizedBox(10),
            TextFormField(
              validator: (value) {
                if (value == '' || value!.isEmpty) {
                  return 'Required';
                }
                return null;
              },
              keyboardType: TextInputType.phone,
              controller: controller.mobileText,
              maxLength: 10,
              decoration: textBoxDecorationStyle('Mobile'),
            ),
            heightSizedBox(10),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: controller.emailText,
              decoration: textBoxDecorationStyle('Email'),
            ),
            heightSizedBox(10),
            DropdownSearch<String>(
              validator: (value) {
                if (value == '' || value!.isEmpty) {
                  return 'Required';
                }
                return null;
              },
              items: (f, cs) => ["Male", 'Female'],
              popupProps: PopupProps.menu(
                  disabledItemFn: (item) => item == 'Item 3',
                  fit: FlexFit.loose),
              decoratorProps: DropDownDecoratorProps(
                decoration: textBoxDecorationStyle('Gender'),
              ),
              mode: Mode.form,
              selectedItem: controller.genderText.value,
              onChanged: (value) {
                controller.genderText.value = value!;
              },
            ),
            heightSizedBox(10),
            TextFormField(
              validator: (value) {
                if (value == '' || value!.isEmpty) {
                  return 'Required';
                }
                return null;
              },
              onTap: () {
                pickDob(
                  context,
                  CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    mode: CupertinoDatePickerMode.date,
                    use24hFormat: true,
                    // This shows day of week alongside day of month
                    showDayOfWeek: true,
                    // This is called when the user changes the date.
                    onDateTimeChanged: (DateTime newDate) {
                      final DateFormat formatter = DateFormat('dd-MM-yyyy');
                      final String formatted = formatter.format(newDate);
                      controller.dobText.text = formatted;
                    },
                  ),
                );
              },
              readOnly: true,
              controller: controller.dobText,
              decoration: textBoxDecorationStyle('DOB'),
            ),
            heightSizedBox(10),
            Obx(
              () => TextFormField(
                validator: (value) {
                  if (value == '' || value!.isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
                controller: controller.registerPasswordText,
                obscureText:
                    controller.isRegisterPasswordVisible.isTrue ? false : true,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.blue,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.blue,
                    ),
                  ),
                  suffixIcon: controller.isRegisterPasswordVisible.isTrue
                      ? IconButton(
                          onPressed: () {
                            controller.isRegisterPasswordVisible.value = false;
                          },
                          icon: const Icon(
                            Icons.visibility,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            controller.isRegisterPasswordVisible.value = true;
                          },
                          icon: const Icon(
                            Icons.visibility_off,
                          ),
                        ),
                ),
              ),
            ),
            heightSizedBox(10),
            Obx(
              () => TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == '' || value!.isEmpty) {
                    return 'Required';
                  }
                  if (controller.registerPasswordText.text !=
                      controller.registerConfirmPasswordText.text) {
                    return 'Password not Same';
                  }
                  return null;
                },
                controller: controller.registerConfirmPasswordText,
                obscureText: controller.isRegisterPasswordConfirmVisible.isTrue
                    ? false
                    : true,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.blue,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.blue,
                    ),
                  ),
                  suffixIcon: controller.isRegisterPasswordConfirmVisible.isTrue
                      ? IconButton(
                          onPressed: () {
                            controller.isRegisterPasswordConfirmVisible.value =
                                false;
                          },
                          icon: const Icon(
                            Icons.visibility,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            controller.isRegisterPasswordConfirmVisible.value =
                                true;
                          },
                          icon: const Icon(
                            Icons.visibility_off,
                          ),
                        ),
                ),
              ),
            ),
            heightSizedBox(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  minWidth: Get.width * 0.3,
                  elevation: 0,
                  color: MyColors.blue,
                  onPressed: () {
                    if (controller.personalInfoFormKey.currentState!
                        .validate()) {
                      controller.activeStep.value = 1;
                    }
                  },
                  child: const Text('NEXT'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void pickDob(BuildContext context, Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  void openPickerModal(BuildContext context, RegisterController controller) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return SizedBox(
            height: Get.height * 0.15,
            width: Get.width,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 4 / 2),
              children: [
                InkWell(
                  onTap: () {
                    openGallery(controller);
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image_rounded),
                      Text('Gallery'),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    openCamera(controller);
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.camera_alt_outlined), Text('Camera')],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void openGallery(RegisterController controller) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      controller.profile.value = image;
      // controller.attachment = image;
      // controller.attachmentName.text = image.name;
      // controller.isAttachment.value = true;
      Get.back();
    } else {}
  }

  void openCamera(RegisterController controller) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (image != null) {
      controller.profile.value = image;
      // controller.attachment = image;
      // controller.attachmentName.text = image.name;
      // controller.isAttachment.value = true;
      Get.back();
    }
  }
}
