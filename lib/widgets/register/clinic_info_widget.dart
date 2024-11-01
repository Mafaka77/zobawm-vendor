import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zobawm_vendor_app/components/my_sizedbox.dart';
import 'package:zobawm_vendor_app/controllers/auth_controller.dart';
import 'package:zobawm_vendor_app/controllers/register_controller.dart';
import 'package:zobawm_vendor_app/styles/text_box_decoration_style.dart';

class ClinicInfoWidget extends GetView<RegisterController> {
  const ClinicInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller.clinicNameText,
            validator: (value) {
              if (value == '' || value!.isEmpty) {
                return 'Required';
              }
              return null;
            },
            decoration: textBoxDecorationStyle('Clinic/Hospital Name'),
          ),
          heightSizedBox(10),
          TextFormField(
            controller: controller.clinicAddressText,
            validator: (value) {
              if (value == '' || value!.isEmpty) {
                return 'Required';
              }
              return null;
            },
            decoration: textBoxDecorationStyle('Clinic/Hospital Address'),
          ),
          heightSizedBox(10),
          TextFormField(
            controller: controller.cityText,
            validator: (value) {
              if (value == '' || value!.isEmpty) {
                return 'Required';
              }
              return null;
            },
            decoration: textBoxDecorationStyle('City'),
          ),
          heightSizedBox(10),
          TextFormField(
            controller: controller.stateText,
            validator: (value) {
              if (value == '' || value!.isEmpty) {
                return 'Required';
              }
              return null;
            },
            decoration: textBoxDecorationStyle('State'),
          ),
          heightSizedBox(10),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: controller.pincodeText,
            validator: (value) {
              if (value == '' || value!.isEmpty) {
                return 'Required';
              }
              return null;
            },
            decoration: textBoxDecorationStyle('Pincode'),
          ),
          heightSizedBox(10),
          TextFormField(
            controller: controller.clinicContactText,
            validator: (value) {
              if (value == '' || value!.isEmpty) {
                return 'Required';
              }
              return null;
            },
            decoration: textBoxDecorationStyle('Clinic Contact No'),
          ),
        ],
      ),
    );
  }
}
