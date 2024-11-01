import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zobawm_vendor_app/services/base_service.dart';
import 'package:zobawm_vendor_app/services/routes.dart';

class RegisterServices extends BaseService {
  Future register(
    String check,
    String? fullName,
    String? gender,
    String? email,
    String? phone,
    String? dob,
    String? password,
    String? passwordConfirmation,
    String? medicalRegistrationNumber,
    String? specialization,
    String? experience,
    String? qualifications,
    String? college,
    String? clinicName,
    String? city,
    String? state,
    String? postalCode,
    String? clinicPhone,
    String? clinicAddress,
    String? bankName,
    String? accountNumber,
    String? ifscCode,
    String? accountHolderName,
    XFile? medicalLicense,
    XFile? idProof,
    XFile? specializationProof,
    XFile? profileImage,
    String? languages,
    XFile? vehicleRegistrationProof,
    XFile? drivingLicense,
    String? vehicleRegistrationNumber,
    String? vehicleType,
    String? degree,
  ) async {
    try {
      switch (check) {
        case 'doctorwithclinic':
          {
            FormData formData = FormData.fromMap({
              'full_name': fullName,
              'gender': gender,
              'email': email,
              'phone': phone,
              'dob': dob,
              'password': password,
              'password_confirmation': passwordConfirmation,
              'medical_registration_number': medicalRegistrationNumber,
              'specialization': specialization,
              'experience': experience,
              'qualifications': qualifications,
              'college': college,
              'clinic_name': clinicName,
              'city': city,
              'state': state,
              'postal_code': postalCode,
              'clinic_phone': clinicPhone,
              'clinic_address': clinicAddress,
              'bank_name': bankName,
              'account_number': accountNumber,
              'ifsc_code': ifscCode,
              'account_holder_name': accountHolderName,
              'medical_license': medicalLicense!.path.isEmpty
                  ? null
                  : await MultipartFile.fromFile(
                      medicalLicense.path,
                      filename: medicalLicense.name,
                    ),
              'id_proof': idProof!.path.isEmpty
                  ? null
                  : await MultipartFile.fromFile(
                      idProof.path,
                      filename: idProof.name,
                    ),
            });
            var response = await client.post(
              Routes.REGISTER_DOCTOR_WITH_CLINIC,
              data: formData,
            );
            print(response.data);
            return response;
          }
        case 'calldoctor':
          {
            print('Hello');
          }
      }
    } catch (ex) {
      return Future.error(ex);
    }
  }
}
