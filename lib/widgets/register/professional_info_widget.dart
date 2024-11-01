import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zobawm_vendor_app/components/my_colors.dart';
import 'package:zobawm_vendor_app/components/my_sizedbox.dart';
import 'package:zobawm_vendor_app/controllers/auth_controller.dart';
import 'package:zobawm_vendor_app/controllers/register_controller.dart';
import 'package:zobawm_vendor_app/styles/text_box_decoration_style.dart';
import 'package:zobawm_vendor_app/widgets/register/clinic_info_widget.dart';

class ProfessionalInfoWidget extends GetView<RegisterController> {
  final String roles;
  const ProfessionalInfoWidget({super.key, required this.roles});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: controller.professionalFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              roles == 'calltechnician'
                  ? Container()
                  : roles == 'callambulance'
                      ? TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                          controller: controller.vehicleRegistrationText,
                          decoration: textBoxDecorationStyle(
                              'Vehicle Registration Number'),
                        )
                      : TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                          controller: controller.registrationNumberText,
                          decoration:
                              textBoxDecorationStyle('Registration Number'),
                        ),
              heightSizedBox(10),
              roles == 'calltechnician' || roles == 'callnurse'
                  ? TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      controller: controller.degreeText,
                      decoration: textBoxDecorationStyle('Degree'),
                    )
                  : roles == 'callambulance'
                      ? TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                          controller: controller.specializationText,
                          decoration: textBoxDecorationStyle('Vehicle Type'),
                        )
                      : TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                          controller: controller.specializationText,
                          decoration: textBoxDecorationStyle('Specialization'),
                        ),
              heightSizedBox(10),
              TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
                controller: controller.experienceText,
                decoration: textBoxDecorationStyle('Experience'),
              ),
              heightSizedBox(10),
              roles == 'calltechnician' || roles == 'callambulance'
                  ? Container()
                  : TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      controller: controller.qualificationText,
                      decoration: textBoxDecorationStyle('Qualification'),
                    ),
              roles == 'calltechnician' || roles == 'callambulance'
                  ? Container()
                  : heightSizedBox(10),
              roles == 'calltechnician' || roles == 'callambulance'
                  ? Container()
                  : TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      controller: controller.collegeText,
                      decoration:
                          textBoxDecorationStyle('Medical School/College'),
                    ),
              roles == 'calltechnician' || roles == 'callambulance'
                  ? Container()
                  : heightSizedBox(10),
              roles == 'doctorwithclinic'
                  ? Container()
                  : TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      controller: controller.languageSpokenText,
                      decoration: textBoxDecorationStyle('Language Spoken'),
                    ),
              heightSizedBox(10),
              roles == 'doctorwithclinic'
                  ? const ClinicInfoWidget()
                  : Container(),
              heightSizedBox(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    elevation: 0,
                    minWidth: Get.width * 0.4,
                    onPressed: () {
                      controller.activeStep.value = 0;
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
                      if (controller.professionalFormKey.currentState!
                          .validate()) {
                        controller.activeStep.value = 2;
                      }
                    },
                    child: const Text('NEXT'),
                  ),
                ],
              ),
              heightSizedBox(40),
            ],
          ),
        ));
  }
}
