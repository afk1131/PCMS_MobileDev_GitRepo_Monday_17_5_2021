import 'dart:async';
import 'package:get/get.dart';
import 'package:pcms/http/http.dart';
import 'package:pcms/screens/login/loginPage.dart';

import 'dart:io';

import 'package:pcms/widgets/custom_dialogs_widget.dart';

class ExceptionData {
  String title;
  String message;
  int code;
  ExceptionData({this.title, this.message, this.code = -1});
}

class ExceptionHandler {
  static final ExceptionHandler _exceptionHandler =
      ExceptionHandler._internal();
  ExceptionHandler._internal();
  factory ExceptionHandler() => _exceptionHandler;

  Future<ExceptionData> handleException(Exception e,
      {bool showDialog = true}) async {
    var data = _makeException(e);

    if (showDialog) {
      await Get.dialog(
          GenericAppDialog(
            message: data.message,
          ),
          barrierDismissible: false);

      if (data.code == 401) {
        Get.offAll(LoginPage());
        // Get.to(LoginPage());
      }
    }
    return data;
  }

  ExceptionData _makeException(Exception e) {
    switch (e.runtimeType) {
      case TimeoutException:
        return ExceptionData(
            title: "TimeoutException",
            message: "Check your internet connection.");
      case SocketException:
        return ExceptionData(
            title: "Connectivity", message: "Check your internet connection.");

      case HttpException:
        return ExceptionData(
            title: "Error", message: (e as HttpCustomException).message);

      case HttpCustomException:
        return ExceptionData(
            title: "Error",
            message: (e as HttpCustomException).message,
            code: (e as HttpCustomException).code);
      case BadRequestException:
        return ExceptionData(
            title: "BadRequestException", message: "Bad Request");
      case UnauthorizedAccessException:
        return ExceptionData(
            title: "UnauthorizedAccessException", message: "Bad Request");
      case ResourceNotFoundException:
        return ExceptionData(
            title: "ResourceNotFoundException", message: "Bad Request");
      case FeeException:
        return ExceptionData(
            title: "FeeException", message: (e as FeeException).message);
      default:
        return ExceptionData(
            title: "Error", message: "Unable to process request.");
    }
  }
}

class FeeException extends HttpException {
  FeeException({String message = ''}) : super(message);

  @override
  String toString() {
    var b = new StringBuffer()..write('FeeException: ')..write(message);
    return b.toString();
  }
}
