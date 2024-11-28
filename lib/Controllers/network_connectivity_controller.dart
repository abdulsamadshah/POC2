import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

///
/// Manages Networkconnection activity according to connections
///
class NetworkConnectivityController extends GetxController {
  // Variable and object declaration
  var connectionStatusType = 0.obs;
  final Connectivity _connectivity = Connectivity();

  //Stream to keep listening to network change state
  StreamSubscription? _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    _getConnectionType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
  }

  // a method to get which connection result, if you we connected to internet or no if yes then which network
  Future<void> _getConnectionType() async {
    ConnectivityResult? connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      Get.printInfo(info: 'Connection Error : ${e.message}');
    }
    return _updateState(connectivityResult!);
  }

  // state update, of network, if you are connected to WIFI connectionType will get set to 1,
  // and update the state to the consumer of that variable.
  _updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatusType.value = 1;
        _getChangedData(connectionStatusType.value);
        break;
      case ConnectivityResult.mobile:
        connectionStatusType.value = 2;
        _getChangedData(connectionStatusType.value);
        break;
      case ConnectivityResult.none:
        connectionStatusType.value = 0;
        _getChangedData(connectionStatusType.value);
        break;
      default:
        Get.printInfo(info: 'Connection Default Error : Network Error');
        break;
    }
  }

  _getChangedData(int status) {
    String connectionMessage;
    if (status == 1) {
      connectionMessage = '-------------- Wifi Is On --------------';
    } else if (status == 2) {
      connectionMessage = '-------------- Mobile Data Is On --------------';
    } else {
      connectionMessage = '-------------- No Network Connection --------------';
    }
    Get.printInfo(info: 'Network Status : $connectionMessage');
  }

  @override
  void onClose() {
    //stop listening to network state when app is closed
    _streamSubscription!.cancel();
    super.onClose();
  }
}
