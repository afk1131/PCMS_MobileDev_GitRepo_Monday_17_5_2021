import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcms/utils/app_theme.dart';
import 'package:pcms/utils/size_config.dart';
import 'package:pcms/widgets/box_button.dart';

enum DialogType { SUCCESS, FAILURE, ALERT }

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog(
      {Key key, @required this.message, this.heading, this.isOkPressed})
      : super(key: key);
  final String message;
  final String heading;
  final VoidCallback isOkPressed;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        insetPadding: EdgeInsets.all(30),
        elevation: 0,
        backgroundColor: Colors.white,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
              left: 14.0,
              right: 14.0,
              bottom: 20.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 14.0),
                  child: Text(
                    heading == null ? "confirmation".tr : heading,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    message,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Row(
                  children: [
                    Expanded(
                      child: BoxButton(
                          color: AppTheme.lightGreyColor,
                          title: 'no'.tr,
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          }),
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    Expanded(
                      child: BoxButton(
                        color: AppTheme.primaryColors,
                        title: 'yes'.tr,
                        onPressed: isOkPressed,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ConfirmationDialogWithBoldText extends StatelessWidget {
  const ConfirmationDialogWithBoldText(
      {Key key,
      @required this.message01,
      @required this.messageBold,
      @required this.message03,
      this.heading,
      this.isOkPressed})
      : super(key: key);
  final String message01;
  final String messageBold;
  final String message03;
  final String heading;
  final VoidCallback isOkPressed;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        insetPadding: EdgeInsets.all(30),
        elevation: 0,
        backgroundColor: Colors.white,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
              left: 14.0,
              right: 14.0,
              bottom: 20.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 14.0),
                  child: Text(
                    heading == null ? "confirmation".tr : heading,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            message01,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            messageBold,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            message03,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Row(
                  children: [
                    Expanded(
                      child: BoxButton(
                          color: AppTheme.lightGreyColor,
                          title: 'no'.tr,
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          }),
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    Expanded(
                      child: BoxButton(
                        color: AppTheme.primaryColors,
                        title: 'yes'.tr,
                        onPressed: isOkPressed,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GenericAppDialog extends StatelessWidget {
  const GenericAppDialog(
      {Key key, @required this.message, this.isBlocked = false})
      : super(key: key);
  final String message;
  final bool isBlocked;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Dialog(
        insetPadding: EdgeInsets.all(30),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          child: Stack(
            alignment: Alignment.topCenter,
            // overflow: Overflow.visible,
            children: [
              Container(
                margin: EdgeInsets.only(top: 27),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 0.0,
                        offset: Offset(0.0, 0.0),
                      ),
                    ]),
                padding: const EdgeInsets.only(
                  top: 40.0,
                  left: 14.0,
                  right: 14.0,
                  bottom: 20.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'Error',
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 24),
                      ),
                    ),
                    // SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        message,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    BoxButton(
                        color: AppTheme.primaryColors,
                        title: 'ok'.tr,
                        onPressed: () {
                          if (isBlocked) {
                            // navigate to playstore
                            return;
                          }
                          Navigator.of(context).pop();
                        }),
                  ],
                ),
              ),
              Container(
                width: 55.0,
                height: 55.0,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 4.0, color: Colors.white),
                  shape: BoxShape.circle,
                  color: AppTheme.primaryColors,
                ),
                child:
                    // Image(image: AssetImage('assets/icons/donate.png')),
                    Image.asset(
                  'assets/icons/cancel.png',
                  // height: 50.0,
                  color: Colors.white,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputDialog extends StatelessWidget {
  InputDialog({Key key, @required this.message}) : super(key: key);
  final String message;
  final TextEditingController _controller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Dialog(
        insetPadding: EdgeInsets.all(30),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          child: Stack(
            alignment: Alignment.topCenter,
            // overflow: Overflow.visible,
            children: [
              Container(
                margin: EdgeInsets.only(top: 27),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 0.0,
                        offset: Offset(0.0, 0.0),
                      ),
                    ]),
                padding: const EdgeInsets.only(
                  top: 50.0,
                  left: 24.0,
                  right: 24.0,
                  bottom: 20.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        message,
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 26),
                      ),
                    ),
                    // SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Form(
                        key: formkey,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _controller,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "required".tr;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    BoxButton(
                        color: AppTheme.primaryColors,
                        title: 'ok'.tr,
                        onPressed: () {
                          if (!formkey.currentState.validate()) {
                            return null;
                          }
                          Navigator.of(context).pop(_controller.text);
                        }),
                  ],
                ),
              ),
              Container(
                width: 55.0,
                height: 55.0,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 4.0, color: Colors.white),
                  shape: BoxShape.circle,
                  color: AppTheme.primaryColors,
                ),
                child:
                    // Image(image: AssetImage('assets/icons/donate.png')),
                    Image.asset(
                  'assets/icons/cancel.png',
                  // height: 50.0,
                  color: Colors.white,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  final String message;
  final DialogType type;
  final Function onTapRoute;
  final String dialogHeading;

  const SuccessDialog(
      {Key key,
      @required this.message,
      @required this.type,
      this.onTapRoute,
      this.dialogHeading = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Dialog(
        insetPadding: EdgeInsets.all(30),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          child: Stack(
            alignment: Alignment.topCenter,
            // overflow: Overflow.visible,
            children: [
              Container(
                margin: EdgeInsets.only(top: 27),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 0.0,
                        offset: Offset(0.0, 0.0),
                      ),
                    ]),
                padding: const EdgeInsets.only(
                  top: 40.0,
                  left: 14.0,
                  right: 14.0,
                  bottom: 20.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        type == DialogType.SUCCESS && dialogHeading != ''
                            ? dialogHeading
                            : type == DialogType.SUCCESS
                                ? 'success'.tr
                                : 'alert'.tr,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    // SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        message,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    BoxButton(
                      color: type == DialogType.SUCCESS
                          ? Colors.green
                          : type == DialogType.FAILURE
                              ? AppTheme.primaryColors
                              : HexColor('#f1c40f'),
                      title: 'ok'.tr,
                      onPressed: onTapRoute,
                    ),
                  ],
                ),
              ),
              Container(
                width: 55.0,
                height: 55.0,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 4.0, color: Colors.white),
                  shape: BoxShape.circle,
                  color: type == DialogType.SUCCESS
                      ? Colors.green
                      : type == DialogType.FAILURE
                          ? AppTheme.primaryColors
                          : HexColor('#f1c40f'),
                ),
                child:
                    // Image(image: AssetImage('assets/icons/donate.png')),
                    Image.asset(
                  type == DialogType.SUCCESS
                      ? 'assets/icons/like.png'
                      : type == DialogType.FAILURE
                          ? 'assets/icons/cancel.png'
                          : 'assets/icons/alert.png',
                  // height: 50.0,
                  color: Colors.white,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddAccountDialog extends StatelessWidget {
  const AddAccountDialog({Key key, @required this.message, this.onPressed})
      : super(key: key);
  final String message;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        insetPadding: EdgeInsets.all(30),
        elevation: 0,
        backgroundColor: Colors.white,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 50.0,
              left: 15.0,
              right: 15.0,
              bottom: 20.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    "addAccount".tr,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    message,
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.06,
                ),
                Row(
                  children: [
                    Expanded(
                      child: BoxButton(
                          color: AppTheme.caveGreyColor,
                          title: 'cancel'.tr,
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                    Padding(padding: EdgeInsets.all(10.0)),
                    Expanded(
                      child: BoxButton(
                        color: AppTheme.primaryColors,
                        title: 'ok'.tr,
                        onPressed: onPressed,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DeleteDialog extends StatelessWidget {
  final String message;
  final cancelOnPressed;
  final okOnPressed;

  const DeleteDialog({this.message, this.cancelOnPressed, this.okOnPressed});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Dialog(
        insetPadding: EdgeInsets.all(30),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          child: Stack(
            alignment: Alignment.topCenter,
            // overflow: Overflow.visible,
            children: [
              Container(
                margin: EdgeInsets.only(top: 27),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 0.0,
                        offset: Offset(0.0, 0.0),
                      ),
                    ]),
                padding: const EdgeInsets.only(
                  top: 50.0,
                  left: 24.0,
                  right: 24.0,
                  bottom: 20.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "delete".tr,
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 26),
                      ),
                    ),
                    // SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        message,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: BoxButton(
                            color: AppTheme.caveGreyColor,
                            title: 'cancel'.tr,
                            onPressed: cancelOnPressed,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                        ),
                        Expanded(
                          child: BoxButton(
                            color: AppTheme.primaryColors,
                            title: 'yes'.tr,
                            onPressed: okOnPressed,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 55.0,
                height: 55.0,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 4.0, color: Colors.white),
                    shape: BoxShape.circle,
                    color: AppTheme.primaryColors),
                child: Image.asset(
                  'assets/icons/cancel.png',
                  // height: 50.0,
                  color: Colors.white,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class PasswordDialog extends StatelessWidget {
//   final String message;
//   final cancelOnPressed;
//   final okOnPressed;
//   final passwordValidator;
//   final passwordController;
//   final GlobalKey<FormState> formKey;
//   final key;

//   const PasswordDialog(
//       {this.message,
//       this.cancelOnPressed,
//       this.okOnPressed,
//       this.passwordController,
//       this.passwordValidator,
//       this.formKey,
//       this.key});

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () => Future.value(false),
//       child: Dialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         insetPadding: EdgeInsets.all(30),
//         elevation: 0,
//         backgroundColor: Colors.white,
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
//           child: Form(
//             key: key,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 16.0),
//                   child: Text(
//                     "verifyPassword".tr,
//                     style: Theme.of(context).textTheme.headline6,
//                   ),
//                 ),
//                 // SizedBox(height: 16.0),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 15.0),
//                   child: Text(
//                     message,
//                     style: Theme.of(context).textTheme.bodyText1,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 Form(
//                   key: formKey,
//                   child: PasswordWidget(
//                     title: 'password'.tr,
//                     prefixImageIconPath: 'assets/icons/password.png',
//                     hintValue: 'password'.tr,
//                     validator: passwordValidator,
//                     controller: passwordController,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(12.0),
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: BoxButton(
//                         color: AppTheme.placeHolderColor,
//                         title: 'cancel'.tr,
//                         onPressed: cancelOnPressed,
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(5.0),
//                     ),
//                     Expanded(
//                       child: BoxButton(
//                         color: AppTheme.primaryColors,
//                         title: 'ok'.tr,
//                         onPressed: okOnPressed,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class DialogWidget extends StatelessWidget {
  final String message;
  final okOnPressed;
  DialogWidget({this.message, this.okOnPressed});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        insetPadding: EdgeInsets.all(30),
        elevation: 0,
        backgroundColor: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
          child: Form(
            key: key,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    "Contact Us",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                // SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0, top: 16.0),
                  child: Text(
                    message,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(12.0),
                ),
                BoxButton(
                  color: AppTheme.primaryColors,
                  title: 'ok'.tr,
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordPolicyWidget extends StatelessWidget {
  const PasswordPolicyWidget({Key key, @required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        insetPadding: EdgeInsets.symmetric(
            horizontal: 10, vertical: SizeConfig.blockSizeVertical * 20),
        elevation: 0,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 18.0,
            left: 15.0,
            right: 15.0,
            bottom: 10.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "passwordPolicy".tr,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Expanded(child: child),
                  // Expanded(
                  //     child: ListView(
                  //   children: [
                  //     for (String passwordPolicy in globalCache
                  //         .configurationResponse.passwordPolicyText)
                  //       Padding(
                  //         padding: const EdgeInsets.only(top: 0.0),
                  //         child: bulletPoint(passwordPolicy, context),
                  //       ),
                  //   ],
                  // )),

                  /*SizedBox(
                        height: Get.height * 0.06,
                      ),*/
                ],
              )),
              // SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: BoxButton(
                        color: AppTheme.primaryColors,
                        title: 'ok'.tr,
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bulletPoint(String text, context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '•',
          // style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 30),
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: AppTheme.darkBlueColor),
        ),
        //  buttlet(),
        SizedBox(width: 10),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(text),
        ))
      ],
    );
  }
}

class MoreActionDialog extends StatelessWidget {
  const MoreActionDialog(
      {Key key,
      this.heading,
      @required this.optionText,
      @required this.icons,
      @required this.onClicks,
      this.isOkPressed})
      : super(key: key);
  final String heading;
  final VoidCallback isOkPressed;
  final List<String> optionText;
  final List<String> icons;
  final List<Function> onClicks;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      insetPadding: EdgeInsets.all(10),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 12.0,
            right: 12.0,
            bottom: 10.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  heading == null ? "moreActions".tr : heading,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Column(
                children: optionText
                    .asMap()
                    .map((key, value) => MapEntry(
                          key,
                          moreActionsRowItem(context,
                              iconName: icons[key],
                              text: value,
                              onClick: onClicks[key]),
                        ))
                    .values
                    .toList(),
                // moreActionsRowItem(context, iconName:"network.png", text: "linkAccount".tr+"(s)"),
                // moreActionsRowItem(context, iconName:"gear.png", text: "blockCard".tr),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: BoxButton(
                        color: AppTheme.primaryColors,
                        title: 'cancel'.tr,
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        }),
                  ),
                  // Padding(padding: EdgeInsets.all(8.0)),
                  // Expanded(
                  //   child: BoxButton(
                  //     color: AppTheme.primaryColors,
                  //     title: 'ok'.tr,
                  //     onPressed: isOkPressed,
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget moreActionsRowItem(BuildContext context,
      {String iconName, String text, Function onClick}) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1, vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.indigo[50],
          // color: AppTheme.lightGreyColor,
          // color: Color(0xffc4d3ee),
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          border: Border.all(
            color: AppTheme.lightGreyBorderColor.withOpacity(0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: AppTheme.lightGreyBorderColor
                  .withOpacity(0.2), //color of shadow
              spreadRadius: 1, //spread radius
              blurRadius: 3, // blur radius
              offset: Offset(0, 0.5), // changes position of shadow
              //first parameter of offset is left-right
              //second parameter is top to down
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                "assets/icons/" + iconName,
                width: 20,
                height: 20,
                color: AppTheme.blackColor,
                // colorBlendMode: BlendMode.dstOut,
              ),
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontSize: 15, color: AppTheme.blackColor),
            ),
            Spacer(),
            Icon(
              Icons.chevron_right_sharp,
              color: AppTheme.darkGreyBorderColor,
            )
          ],
        ),
      ),
      onTap: onClick,
    );
  }
}
