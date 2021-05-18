import 'package:get/get.dart';

class Validators {
  static final _instance = Validators._internal();

  factory Validators() => _instance;

  Validators._internal();

  String validateUserId(String value) {
    if (value.isEmpty) {
      return "userIdRequired".tr;
    } else
      return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return "passwordRequired".tr;
    }
    //  else if (verifyPassword(value)) {
    //   return 'newPasswordError'.tr;
    // }
    else
      return null;
  }

  static bool verifyPassword(String value) {
    Pattern pattern =
        r'^(?=.*\d+)(?=.*[A-Z])(?=.*[a-z])(?=.*[#?!@$%^&*-])(?!.*[\\/:\s_=`~{}[\];,<.>?|"])\S{8,16}$';
    RegExp regex = new RegExp(pattern);
    bool status = !regex.hasMatch(value);
    if (value.indexOf('\'') != -1) {
      status = true;
    }
    return status;
  }

  String validateConfirmPassword(String newPass, String confirmPass) {
    if (confirmPass.isEmpty) {
      return "passwordRequired".tr;
    } else if (confirmPass != newPass)
      return 'confirmPasswordError'.tr;
    else
      return null;
  }
}
