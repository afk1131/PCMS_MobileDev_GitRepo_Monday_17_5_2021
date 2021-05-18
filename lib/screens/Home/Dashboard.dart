import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcms/screens/Home/DashboardController.dart';
import 'package:pcms/widgets/customLoaderWidget.dart';

class Dashbaord extends StatelessWidget {
  final DashboardController dashboardcontroller =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomLoaderWidget(
        isTrue: dashboardcontroller.isLoading.value,
        child: Scaffold(
          body: SafeArea(
            bottom: false,
            child: Center(
              child: Form(
                key: dashboardcontroller.dashboardpageformkey,
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: Text(
                        " Welcome to PCMS",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )));
  }
}
