import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zobawm_vendor_app/components/my_app_bar.dart';
import 'package:zobawm_vendor_app/controllers/auth_controller.dart';
import 'package:zobawm_vendor_app/controllers/register_controller.dart';
import 'package:zobawm_vendor_app/widgets/register/bank_info_widget.dart';
import 'package:zobawm_vendor_app/widgets/register/document_info_widget.dart';
import 'package:zobawm_vendor_app/widgets/register/personal_info_widget.dart';
import 'package:zobawm_vendor_app/widgets/register/professional_info_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var rolesText = Get.parameters['roles'];

    return GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (controller) {
          AuthController authController = Get.find();
          return Scaffold(
            appBar: myAppBar('Register'),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => EasyStepper(
                      activeStep: controller.activeStep.value.toInt(),
                      activeStepTextColor: Colors.black87,
                      finishedStepTextColor: Colors.black87,
                      internalPadding: 20,
                      showLoadingAnimation: false,
                      stepRadius: 10,
                      showStepBorder: true,
                      steps: [
                        EasyStep(
                          customStep: CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 7,
                              backgroundColor: controller.activeStep.value >= 0
                                  ? Colors.orange
                                  : Colors.white,
                            ),
                          ),
                          title: 'Personal Info',
                        ),
                        EasyStep(
                          customStep: CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 7,
                              backgroundColor: controller.activeStep.value >= 1
                                  ? Colors.orange
                                  : Colors.white,
                            ),
                          ),
                          title: 'Professional Info',
                          topTitle: true,
                        ),
                        EasyStep(
                          customStep: CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 7,
                              backgroundColor: controller.activeStep.value >= 2
                                  ? Colors.orange
                                  : Colors.white,
                            ),
                          ),
                          title: 'Documents',
                        ),
                        EasyStep(
                          customStep: CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 7,
                              backgroundColor: controller.activeStep.value >= 3
                                  ? Colors.orange
                                  : Colors.white,
                            ),
                          ),
                          title: 'Bank Details',
                          topTitle: true,
                        ),
                      ],
                      // onStepReached: (index) => setState(() => activeStep = index),
                    ),
                  ),
                  Obx(
                    () => controller.activeStep.value == 0
                        ? const PersonalInfoWidget()
                        : controller.activeStep.value == 1
                            ? ProfessionalInfoWidget(roles: rolesText!)
                            : controller.activeStep.value == 2
                                ? DocumentInfoWidget(
                                    role: rolesText!,
                                  )
                                : controller.activeStep.value == 3
                                    ? BankInfoWidget(
                                        roles: rolesText!,
                                      )
                                    : Container(),
                  )
                ],
              ),
            ),
          );
        });
  }
}
