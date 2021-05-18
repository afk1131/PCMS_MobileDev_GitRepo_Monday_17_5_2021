import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcms/blocs/authentication/authBloc.dart';
import 'package:pcms/http/exception_checker.dart';
import 'package:pcms/widgets/custom_dialogs_widget.dart';

class LoginController extends GetxController {
  final AuthenticationBloc authbloc = AuthenticationBloc();

  // final LocalAuthenticationService localAuth = new LocalAuthenticationService();
  final loginPageFormKey = GlobalKey<FormState>();
  // LoginApiResponse loginResponse;

  RxBool hidePassword = true.obs;
  var isLoading = false.obs;

  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    if (!kReleaseMode) {
      userIdController.text = 'jazibuser';
      passwordController.text = 'tpstps';
    }
  }

  register() {}
  signIn() async {
    if (!loginPageFormKey.currentState.validate()) {
      return;
    }
    try {
      isLoading(true);
      //await Future.delayed(Duration(seconds: 5));
      await authbloc.loginCall(userIdController.text, passwordController.text);
      isLoading(false);
      Get.dialog(
        SuccessDialog(
          message: 'Login Success',
          type: DialogType.SUCCESS,
          onTapRoute: () => Get.back(),
        ),
      );
    } catch (e) {
      isLoading(false);
      ExceptionHandler().handleException(e);
      //FirebaseManager.sendCustomEvent('Login failure');
    }
  }
}
