//import 'dart:convert';
//import 'dart:io';

import 'package:pcms/http/api_response_handler.dart';
import 'package:pcms/utils/global.dart';

import 'authModel.dart';

class AuthenticationBloc {
  // Future<ClientTokenResponse> getClientToken() async {
  //   var _http = await ApiResponseInjector().httpDataSource(ApiType.DefaultApi);
  //   var res = await _http.post(
  //     pathsEnv.clientToken,
  //     body: {
  //       // "client_id": "moiz_sokin",
  //       // "client_secret": "moiz_sokin",
  //       "grant_type": "client_credentials",
  //     },
  //     token: GlobalConstants.LOGIN_TOKEN,
  //   );
  //   var jsonResp = ClientTokenResponse.fromJson(res);
  //   authenticator.setClientToken(jsonResp.accessToken);
  //   return jsonResp;
  // }

  Future<LoginResponse> loginCall(String userName, String password) async {
    // String deviceID;
    // String deviceType = Helper.getDeviceType();

    // if (Platform.isAndroid) {
    //   var deviceInfo = DeviceInfoPlugin();
    //   var androidInfo = await deviceInfo.androidInfo;
    //   deviceID = androidInfo.androidId;
    // } else {
    //   var deviceInfo = DeviceInfoPlugin();
    //   IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    //   deviceID = iosInfo.identifierForVendor;
    // }

    var _http = await ApiResponseInjector().httpDataSource(ApiType.DefaultApi);
    var res = await _http.get(
      Paths.login,
      queryParameters: {
        "UserID": userName, //"jazibuser",
        "Password": password, //"tpstps",
        "ProductId": "0018",
        "AuthrizationLevel": "Inst",
      },
      // ?UserID=&Password=tpstps&ProductId=0018&AuthrizationLevel=Inst

      // token: GlobalConstants.LOGIN_TOKEN,
    );

    var jsonResp = LoginResponse.fromJson(res.first);
    authenticator.setUserToken(jsonResp.currentSessionID);

    // if (globalCache.fcmToken != jsonResp.pushId) {
    //   await updatePushId();
    // }

    return jsonResp;
  }

  // Future updatePushId() async {
  //   var _http = await ApiResponseInjector().httpDataSource(ApiType.DefaultApi);
  //   var res = await _http.post(
  //     pathsEnv.updatePushId,
  //     token: authenticator.getUserToken(),
  //     body: {"push_id": globalCache.fcmToken},
  //   );

  //   return res;
  // }
}
