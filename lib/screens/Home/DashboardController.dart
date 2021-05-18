import 'package:get/get.dart';
import 'package:pcms/blocs/authentication/authBloc.dart';
import 'package:flutter/material.dart';

class DashboardController extends GetxController {
  final AuthenticationBloc authbloc = AuthenticationBloc();

  // final LocalAuthenticationService localAuth = new LocalAuthenticationService();
  final dashboardpageformkey = GlobalKey<FormState>();
  // DashBoardApiResponse dashboarAPI;
  var isLoading = false.obs;
}
