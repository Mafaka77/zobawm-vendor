import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zobawm_vendor_app/components/my_app_bar.dart';
import 'package:zobawm_vendor_app/components/my_sizedbox.dart';

class BecomePartnerScreen extends StatelessWidget {
  const BecomePartnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(''),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ExpansionTile(
                title: const Text('Medical Services'),
                dense: true,
                children: [
                  ListTile(
                    onTap: () {
                      Get.toNamed('/register/doctorwithclinic');
                    },
                    dense: true,
                    title: const Text('Doctor with Clinic'),
                    tileColor: Colors.white,
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                  heightSizedBox(10),
                  ListTile(
                    onTap: () {
                      Get.toNamed('/register/calldoctor');
                    },
                    dense: true,
                    title: const Text('Doctor on Call'),
                    tileColor: Colors.white,
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                  heightSizedBox(10),
                  ListTile(
                    onTap: () {
                      Get.toNamed('/register/callnurse');
                    },
                    dense: true,
                    title: const Text('Nurse on Call'),
                    tileColor: Colors.white,
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                  heightSizedBox(10),
                  ListTile(
                    onTap: () {
                      Get.toNamed('/register/calltechnician');
                    },
                    dense: true,
                    title: const Text('Call Lab Technician'),
                    tileColor: Colors.white,
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                  heightSizedBox(10),
                  ListTile(
                    onTap: () {
                      Get.toNamed('/register/callambulance');
                    },
                    dense: true,
                    title: const Text('Call an Ambulance'),
                    tileColor: Colors.white,
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                  heightSizedBox(10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
