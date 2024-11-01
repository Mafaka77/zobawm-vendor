import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zobawm_vendor_app/components/my_colors.dart';
import 'package:zobawm_vendor_app/components/my_sizedbox.dart';
import 'package:zobawm_vendor_app/controllers/auth_controller.dart';
import 'package:zobawm_vendor_app/controllers/register_controller.dart';
import 'package:zobawm_vendor_app/styles/text_box_decoration_style.dart';
import 'package:zobawm_vendor_app/widgets/register/ambulance_document_widget.dart';

class DocumentInfoWidget extends GetView<RegisterController> {
  final String role;
  const DocumentInfoWidget({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: controller.documentFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: role == 'callambulance'
            ? const AmbulanceDocumentWidget()
            : Column(
                children: [
                  Obx(() => TextFormField(
                        controller: controller.registrationProofText,
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
                          suffixIcon: controller
                                  .isRegistrationProofPicked.isTrue
                              ? IconButton(
                                  onPressed: () {
                                    controller.registrationProof.value =
                                        XFile('');
                                    controller.registrationProofText.clear();
                                    controller.isRegistrationProofPicked.value =
                                        false;
                                  },
                                  icon: const Icon(Icons.clear),
                                )
                              : const Icon(Icons.attach_file),
                        ),
                      )),
                  heightSizedBox(10),
                  Obx(
                    () => TextFormField(
                      controller: controller.idProofText,
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
                        suffixIcon: controller.isIdProofPicked.isTrue
                            ? IconButton(
                                onPressed: () {
                                  controller.idProof.value = XFile('');
                                  controller.idProofText.clear();
                                  controller.isIdProofPicked.value = false;
                                },
                                icon: const Icon(Icons.clear),
                              )
                            : const Icon(Icons.attach_file),
                      ),
                    ),
                  ),
                  heightSizedBox(10),
                  role == 'doctorwithclinic'
                      ? Obx(() => TextFormField(
                            controller: controller.specializationProofText,
                            onTap: () {
                              openSpecializationModal(context, controller);
                            },
                            readOnly: true,
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
                              labelText: 'Upload Specialization Certificate',
                              counterText: '',
                              suffixIcon: controller
                                      .isSpecializationPicked.isTrue
                                  ? IconButton(
                                      onPressed: () {
                                        controller.specializationProof.value =
                                            XFile('');
                                        controller.specializationProofText
                                            .clear();
                                        controller.isSpecializationPicked
                                            .value = false;
                                      },
                                      icon: const Icon(Icons.clear),
                                    )
                                  : const Icon(Icons.attach_file),
                            ),
                          ))
                      : Container(),
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
                          if (controller.documentFormKey.currentState!
                              .validate()) {
                            controller.activeStep.value = 3;
                          }
                        },
                        child: const Text('NEXT'),
                      ),
                    ],
                  )
                ],
              ),
      ),
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
      controller.registrationProof.value = image;
      controller.registrationProofText.text = image.name;
      controller.isRegistrationProofPicked.value = true;
      Get.back();
    } else {}
  }

  void openRegistrationCamera(RegisterController controller) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (image != null) {
      controller.registrationProof.value = image;
      controller.registrationProofText.text = image.name;
      controller.isRegistrationProofPicked.value = true;
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
      controller.idProof.value = image;
      controller.idProofText.text = image.name;
      controller.isIdProofPicked.value = true;
      Get.back();
    } else {}
  }

  void openIDCamera(RegisterController controller) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (image != null) {
      controller.idProof.value = image;
      controller.idProofText.text = image.name;
      controller.isIdProofPicked.value = true;
      Get.back();
    }
  }

  void openSpecializationModal(
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
                    openSpecializationGallery(controller);
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
                    openSpecializationCamera(controller);
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

  void openSpecializationGallery(RegisterController controller) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      controller.specializationProof.value = image;
      controller.specializationProofText.text = image.name;
      controller.isSpecializationPicked.value = true;
      Get.back();
    } else {}
  }

  void openSpecializationCamera(RegisterController controller) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (image != null) {
      controller.specializationProof.value = image;
      controller.specializationProofText.text = image.name;
      controller.isSpecializationPicked.value = true;
      Get.back();
    }
  }
}
