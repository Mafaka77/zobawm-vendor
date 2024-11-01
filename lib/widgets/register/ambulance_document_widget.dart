import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zobawm_vendor_app/components/my_colors.dart';
import 'package:zobawm_vendor_app/components/my_sizedbox.dart';
import 'package:zobawm_vendor_app/controllers/register_controller.dart';

class AmbulanceDocumentWidget extends GetView<RegisterController> {
  const AmbulanceDocumentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => TextFormField(
              controller: controller.vehicleRegistrationProofText,
              onTap: () {
                openRegistrationModal(context, controller);
              },
              readOnly: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Required';
                }
                return null;
              },
              decoration: InputDecoration(
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
                labelText: 'Upload Registration Proof',
                counterText: '',
                suffixIcon: controller.isVehicleRegsitrationPicked.isTrue
                    ? IconButton(
                        onPressed: () {
                          controller.vehicleRegistrationProof.value = XFile('');
                          controller.vehicleRegistrationProofText.clear();
                          controller.isVehicleRegsitrationPicked.value = false;
                        },
                        icon: const Icon(Icons.clear),
                      )
                    : const Icon(Icons.attach_file),
              ),
            )),
        heightSizedBox(10),
        Obx(
          () => TextFormField(
            controller: controller.drivingLicenseProofText,
            onTap: () {
              openIDModal(context, controller);
            },
            readOnly: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Required';
              }
              return null;
            },
            decoration: InputDecoration(
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
              labelText: 'Upload ID Proof',
              counterText: '',
              suffixIcon: controller.isDrivingLicensePicked.isTrue
                  ? IconButton(
                      onPressed: () {
                        controller.drivingLicenseProof.value = XFile('');
                        controller.drivingLicenseProofText.clear();
                        controller.isDrivingLicensePicked.value = false;
                      },
                      icon: const Icon(Icons.clear),
                    )
                  : const Icon(Icons.attach_file),
            ),
          ),
        ),
        heightSizedBox(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              elevation: 0,
              minWidth: Get.width * 0.4,
              onPressed: () {
                controller.activeStep.value = 1;
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
                if (controller.documentFormKey.currentState!.validate()) {
                  controller.activeStep.value = 3;
                }
              },
              child: const Text('NEXT'),
            ),
          ],
        )
      ],
    );
  }

  void openRegistrationModal(
      BuildContext context, RegisterController controller) {
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
                    openRegistrationGallery(controller);
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
                    openRegistrationCamera(controller);
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

  void openRegistrationGallery(RegisterController controller) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      controller.vehicleRegistrationProof.value = image;
      controller.vehicleRegistrationProofText.text = image.name;
      controller.isVehicleRegsitrationPicked.value = true;
      Get.back();
    } else {}
  }

  void openRegistrationCamera(RegisterController controller) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (image != null) {
      controller.vehicleRegistrationProof.value = image;
      controller.vehicleRegistrationProofText.text = image.name;
      controller.isVehicleRegsitrationPicked.value = true;
      Get.back();
    }
  }

  void openIDModal(BuildContext context, RegisterController controller) {
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
                    openIDGallery(controller);
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
                    openIDCamera(controller);
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

  void openIDGallery(RegisterController controller) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      controller.drivingLicenseProof.value = image;
      controller.drivingLicenseProofText.text = image.name;
      controller.isDrivingLicensePicked.value = true;
      Get.back();
    } else {}
  }

  void openIDCamera(RegisterController controller) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (image != null) {
      controller.drivingLicenseProof.value = image;
      controller.drivingLicenseProofText.text = image.name;
      controller.isDrivingLicensePicked.value = true;
      Get.back();
    }
  }
}
