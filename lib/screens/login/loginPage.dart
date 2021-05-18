import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcms/screens/login/loginController.dart';
import 'package:pcms/utils/global.dart';
import 'package:pcms/utils/validators.dart';
import 'package:pcms/widgets/customButton.dart';
import 'package:pcms/widgets/customLoaderWidget.dart';
import 'package:pcms/widgets/customTextFieldWidget.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

// ::Main Method Started::
  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomLoaderWidget(
          isTrue: loginController.isLoading.value,
          child: Scaffold(
            body: SafeArea(
              bottom: false,
              child: Center(
                child: Form(
                  key: loginController.loginPageFormKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            _logo(),
                            SizedBox(
                              height: 15,
                            ),
                            _usernameField(),
                            _passwordField(),
                            _registerButton(),
                            _signInButton(),
                            _resetPassword(),
                            _termsandConditions(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _branchLocator(),
                                _contactUs(),
                                _currentPromotions(),
                              ],
                            )
                          ],
                        ),
                      ),
                      // _bottomSheet(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

// ::Main Method Ended::
  Widget _registerButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 06,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: CustomButton(
              lable: 'Register'.tr,
              textColor: ThemeConstants.buttonTextColor,
              fontSize: 18,
              bold: true,
              buttonColor: ThemeConstants.buttonColor,
              onTap: loginController.register(),
            ),
          )
        ],
      ),
    );
  }

  Widget _signInButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 06,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: CustomButton(
              lable: 'login'.tr,
              textColor: ThemeConstants.buttonTextColor,
              fontSize: 18,
              bold: true,
              buttonColor: ThemeConstants.buttonColor,
              onTap: loginController.signIn,
            ),
          )
        ],
      ),
    );
  }

  Widget _logo() {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/logo.png',
            height: 60,
          ),
        ],
      ),
    );
  }

  Widget _usernameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      child: CustomTextFieldWidget(
        // enabled: !_isLoading,
        type: TextInputType.emailAddress,
        validator: Validators().validateUserId,
        controller: loginController.userIdController,
        prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Icon(
              Icons.person,
              size: 30,
              color: ThemeConstants.greyIconColor,
            )),
        upperLabel: 'enterUserId'.tr,
      ),
    );
  }

  Widget _passwordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomTextFieldWidget(
        type: TextInputType.visiblePassword,
        validator: Validators().validatePassword,
        controller: loginController.passwordController,
        obscureText: loginController.hidePassword.value,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Icon(
            Icons.lock,
            size: 30,
            color: ThemeConstants.greyIconColor,
          ),
        ),
        // hintValue: 'enterPassword'.tr,
        upperLabel: 'enterPassword'.tr,
        suffixIcon: GestureDetector(
          onTap: loginController.hidePassword.toggle,
          child: Icon(
            loginController.hidePassword.value == true
                ? Icons.visibility_off
                : Icons.visibility,
            size: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _resetPassword() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Expanded(
          child: Text(
            'Reset Password?',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ),
        ));
  }

  Widget _termsandConditions() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Expanded(
        child: Text(
          'Terms And Conditions',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _branchLocator() {
    return Padding(
      padding: EdgeInsets.all(25),
      child: FlatButton(
        onPressed: () => {},
        color: Colors.transparent,
        padding: EdgeInsets.all(10.0),
        child: Column(
          // Replace with a Row for horizontal icon + text
          children: <Widget>[
            Icon(
              Icons.location_pin,
              color: ThemeConstants.buttonColor,
            ),
            Text(
              'Branch\nLocator',
              style: TextStyle(
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _contactUs() {
    return Padding(
        padding: EdgeInsets.all(25),
        child: FlatButton(
          onPressed: () => {},
          color: Colors.transparent,
          padding: EdgeInsets.all(10.0),
          child: Column(
            // Replace with a Row for horizontal icon + text
            children: <Widget>[
              Icon(
                Icons.phone,
                color: ThemeConstants.buttonColor,
              ),
              Text(
                'Contact\nUS',
                style: TextStyle(
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }

  Widget _currentPromotions() {
    return Padding(
      padding: EdgeInsets.all(25),
      child: FlatButton(
        onPressed: () => {},
        color: Colors.transparent,
        padding: EdgeInsets.all(10.0),
        child: Column(
          // Replace with a Row for horizontal icon + text
          children: <Widget>[
            Icon(
              Icons.assignment_sharp,
              color: ThemeConstants.buttonColor,
            ),
            Text(
              'Current\nPromotions',
              style: TextStyle(color: Colors.blue),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
