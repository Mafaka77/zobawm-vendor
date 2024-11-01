import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zobawm_vendor_app/services/register_services.dart';

class RegisterController extends GetxController {
  RegisterServices services = Get.find(tag: 'registerServices');
  var activeStep = 0.obs;
  //PERSONAL INFO
  var personalInfoFormKey = GlobalKey<FormState>();
  var fullNameText = TextEditingController();
  var mobileText = TextEditingController();
  var genderText = ''.obs;
  var dobText = TextEditingController();
  var emailText = TextEditingController();
  var registerPasswordText = TextEditingController();
  var registerConfirmPasswordText = TextEditingController();
  var isRegisterPasswordVisible = false.obs;
  var isRegisterPasswordConfirmVisible = false.obs;
  var profile = XFile('').obs;

  //PROFESSIONAL INFO
  var professionalFormKey = GlobalKey<FormState>();
  var registrationNumberText = TextEditingController();
  var vehicleRegistrationText = TextEditingController();
  var vehicleTypeText = TextEditingController();
  var specializationText = TextEditingController();
  var experienceText = TextEditingController();
  var qualificationText = TextEditingController();
  var collegeText = TextEditingController();
  var languageSpokenText = TextEditingController();
  var clinicNameText = TextEditingController();
  var clinicAddressText = TextEditingController();
  var stateText = TextEditingController();
  var cityText = TextEditingController();
  var pincodeText = TextEditingController();
  var clinicContactText = TextEditingController();
  var degreeText = TextEditingController();
  //DOCUMENTS INFO
  var documentFormKey = GlobalKey<FormState>();
  var isRegistrationProofPicked = false.obs;
  var registrationProof = XFile('').obs;
  var registrationProofText = TextEditingController();
  var isIdProofPicked = false.obs;
  var idProof = XFile('').obs;
  var idProofText = TextEditingController();
  var specializationProof = XFile('').obs;
  var isSpecializationPicked = false.obs;
  var specializationProofText = TextEditingController();
  var vehicleRegistrationProof = XFile('').obs;
  var vehicleRegistrationProofText = TextEditingController();
  var isVehicleRegsitrationPicked = false.obs;
  var drivingLicenseProof = XFile('').obs;
  var drivingLicenseProofText = TextEditingController();
  var isDrivingLicensePicked = false.obs;
  //BANK DETAILS
  var bankFormKey = GlobalKey<FormState>();
  var bankNameText = TextEditingController();
  var bankAccNoText = TextEditingController();
  var bankIfscText = TextEditingController();
  var bankAccHolder = TextEditingController();

  void register(String check, Function onLoading, Function onSuccess,
      Function onError) async {
    onLoading();
    try {
      var response = await services.register(
        check,
        fullNameText.text,
        genderText.value,
        emailText.text,
        mobileText.text,
        dobText.text,
        registerPasswordText.text,
        registerConfirmPasswordText.text,
        registrationNumberText.text,
        specializationText.text,
        experienceText.text,
        qualificationText.text,
        collegeText.text,
        clinicNameText.text,
        cityText.text,
        stateText.text,
        pincodeText.text,
        clinicContactText.text,
        clinicAddressText.text,
        bankAccNoText.text,
        bankAccNoText.text,
        bankIfscText.text,
        bankAccHolder.text,
        registrationProof.value,
        idProof.value,
        specializationProof.value,
        profile.value,
        languageSpokenText.text,
        vehicleRegistrationProof.value,
        drivingLicenseProof.value,
        vehicleRegistrationText.text,
        vehicleTypeText.text,
        degreeText.text,
      );
      onSuccess();
      print(response);
    } catch (ex) {
      onError();
      print(ex);
    }
  }
}
